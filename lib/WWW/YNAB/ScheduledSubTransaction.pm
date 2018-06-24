package WWW::YNAB::ScheduledSubTransaction;
use Moose;

has id => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has scheduled_transaction_id => (
    is  => 'ro',
    isa => 'Str',
);

has amount => (
    is  => 'ro',
    isa => 'Int',
);

has memo => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

has payee_id => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

has category_id => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

has transfer_account_id => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

has deleted => (
    is  => 'ro',
    isa => 'Bool',
);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
