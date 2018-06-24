package WWW::YNAB::Payee;

use Moose;
# ABSTRACT: Payee model object

=head1 SYNOPSIS

  use WWW::YNAB;

  my $ynab = WWW::YNAB->new(...);
  my @budgets = $ynab->budgets;
  my $payee = $budgets[0]->payee('12345678-1234-1234-1234-1234567890ab');

=head1 OVERVIEW

See L<https://api.youneedabudget.com/v1#/Payees> for more
information.

=cut

=method id

=cut

has id => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

=method name

=cut

has name => (
    is  => 'ro',
    isa => 'Str',
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
