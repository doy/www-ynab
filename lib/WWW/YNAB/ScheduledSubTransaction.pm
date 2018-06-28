package WWW::YNAB::ScheduledSubTransaction;


use 5.010;
use Moose;
# ABSTRACT: ScheduledSubTransaction model object

=head1 SYNOPSIS

  use WWW::YNAB;

  my $ynab = WWW::YNAB->new(...);
  my @budgets = $ynab->budgets;
  my $scheduled_transaction = $budgets[0]->scheduled_transaction('12345678-1234-1234-1234-1234567890ab');
  my @scheduled_sub_transactions = $scheduled_transaction->subtransactions;

=head1 OVERVIEW

See L<https://api.youneedabudget.com/v1#/Scheduled_Transactions> for more
information.

=cut

=method id

=cut

has id => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

=method scheduled_transaction_id

=cut

has scheduled_transaction_id => (
    is  => 'ro',
    isa => 'Str',
);

=method amount

=cut

has amount => (
    is  => 'ro',
    isa => 'Int',
);

=method memo

=cut

has memo => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

=method payee_id

=cut

has payee_id => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

=method category_id

=cut

has category_id => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

=method transfer_account_id

=cut

has transfer_account_id => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

=method deleted

=cut

has deleted => (
    is  => 'ro',
    isa => 'Bool',
);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
