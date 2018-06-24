package WWW::YNAB;
use Moose;

# ABSTRACT: Wrapper for the YNAB API

use WWW::YNAB::Account;
use WWW::YNAB::Budget;
use WWW::YNAB::CategoryGroup;
use WWW::YNAB::Category;
use WWW::YNAB::Month;
use WWW::YNAB::Payee;
use WWW::YNAB::SubTransaction;
use WWW::YNAB::Transaction;
use WWW::YNAB::UA;
use WWW::YNAB::User;

with 'WWW::YNAB::ModelHelpers';

has access_token => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has base_uri => (
    is      => 'ro',
    isa     => 'Str',
    default => 'https://api.youneedabudget.com/v1/',
);

has ua => (
    is      => 'ro',
    isa     => 'HTTP::Tiny',
    lazy    => 1,
    default => sub { HTTP::Tiny->new },
);

has _ua => (
    is      => 'ro',
    isa     => 'WWW::YNAB::UA',
    lazy    => 1,
    default => sub {
        my $self = shift;
        WWW::YNAB::UA->new(
            access_token => $self->access_token,
            base_uri     => $self->base_uri,
            ua           => $self->ua,
        )
    },
);

sub user {
    my $self = shift;

    my $data = $self->_ua->get('/user');
    my $user = $data->{data}{user};
    $self->model_from_data('WWW::YNAB::User', $user);
}

sub budgets {
    my $self = shift;

    my $data = $self->_ua->get('/budgets');
    map {
        $self->model_from_data('WWW::YNAB::Budget', $_)
    } @{ $data->{data}{budgets} };
}

sub budget {
    my $self = shift;
    my ($id, $server_knowledge) = @_;

    my $params;
    if (defined $server_knowledge) {
        $params = {
            last_knowledge_of_server => $server_knowledge,
        }
    }

    my $data = $self->_ua->get("/budgets/$id", $params);
    my $budget = $data->{data}{budget};
    my %budget = %$budget;

    my @accounts = map {
        $self->model_from_data('WWW::YNAB::Account', $_)
    } @{ $budget{accounts} };
    $budget{accounts} = \@accounts;

    my @payees = map {
        $self->model_from_data('WWW::YNAB::Payee', $_)
    } @{ $budget{payees} };
    $budget{payees} = \@payees;

    my @category_groups = map {
        my %category_group = %$_;
        $category_group{categories} = [
            map {
                $self->model_from_data('WWW::YNAB::Category', $_)
            } grep {
                $_->{category_group_id} eq $category_group{id}
            } @{ $budget{categories} }
        ];
        $self->model_from_data('WWW::YNAB::CategoryGroup', \%category_group)
    } @{ $budget{category_groups} };
    $budget{category_groups} = \@category_groups;

    my @months = map {
        my %month = %$_;
        $month{categories} = [
            map {
                $self->model_from_data('WWW::YNAB::Category', $_)
            } @{ $month{categories} }
        ];
        $self->model_from_data('WWW::YNAB::Month', \%month)
    } @{ $budget{months} };
    $budget{months} = \@months;

    my @transactions = map {
        my %transaction = %$_;
        ($transaction{account_name}) = map {
            $_->{name}
        } grep {
            $_->{id} eq $transaction{account_id}
        } @{ $budget{accounts} };
        ($transaction{payee_name}) = map {
            $_->{name}
        } grep {
            $_->{id} eq $transaction{payee_id}
        } @{ $budget{payees} };
        ($transaction{category_name}) = map {
            $_->{name}
        } grep {
            $_->{id} eq $transaction{category_id}
        } @{ $budget{categories} };
        $transaction{subtransactions} = [
            map {
                $self->model_from_data('WWW::YNAB::SubTransaction', $_)
            } grep {
                $_->{transaction_id} eq $transaction{id}
            } @{ $budget{subtransactions} }
        ];
        $self->model_from_data('WWW::YNAB::Transaction', \%transaction)
    } @{ $budget{transactions} };
    $budget{transactions} = \@transactions;

    $self->model_from_data(
        'WWW::YNAB::Budget',
        \%budget,
        $data->{data}{server_knowledge},
    );
}

sub rate_limit {
    my $self = shift;

    $self->_ua->rate_limit
}

sub knows_rate_limit {
    my $self = shift;

    $self->_ua->knows_rate_limit
}

sub total_rate_limit {
    my $self = shift;

    $self->_ua->total_rate_limit
}

sub knows_total_rate_limit {
    my $self = shift;

    $self->_ua->knows_total_rate_limit
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;
