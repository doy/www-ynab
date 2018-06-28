package WWW::YNAB::ScheduledTransaction;


use 5.010;
use Moose;
# ABSTRACT: ScheduledSubTransaction model object

use Moose::Util::TypeConstraints qw(enum maybe_type);

=head1 SYNOPSIS

  use WWW::YNAB;

  my $ynab = WWW::YNAB->new(...);
  my @budgets = $ynab->budgets;
  my $scheduled_transaction = $budgets[0]->scheduled_transaction('12345678-1234-1234-1234-1234567890ab');

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

=method date_first

=cut

has date_first => (
    is  => 'ro',
    isa => 'Str',
);

=method date_next

=cut

has date_next => (
    is  => 'ro',
    isa => 'Str',
);

=method frequency

=cut

has frequency => (
    is  => 'ro',
    isa => enum([qw(
        never daily weekly everyOtherWeek twiceAMonth every4Weeks
        monthly everyOtherMonth every3Months every4Months twiceAYear
        yearly everyOtherYear
    )]),
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

=method flag_color

=cut

has flag_color => (
    is  => 'ro',
    isa => maybe_type(enum([qw(red orange yellow green blue purple)])),
);

=method account_id

=cut

has account_id => (
    is  => 'ro',
    isa => 'Str',
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

=method account_name

=cut

has account_name => (
    is  => 'ro',
    isa => 'Str',
);

=method payee_name

=cut

has payee_name => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

=method category_name

=cut

has category_name => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

=method subtransactions

=cut

has subtransactions => (
    traits  => ['Array'],
    is      => 'bare',
    isa     => 'ArrayRef[WWW::YNAB::ScheduledSubTransaction]',
    handles => {
        subtransactions => 'elements',
    }
);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
