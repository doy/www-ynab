package WWW::YNAB::Category;

use Moose;
# ABSTRACT: Category model object

=head1 SYNOPSIS

  use WWW::YNAB;

  my $ynab = WWW::YNAB->new(...);
  my @budgets = $ynab->budgets;
  my $transaction = $budgets[0]->category('12345678-1234-1234-1234-1234567890ab');

=head1 OVERVIEW

See L<https://api.youneedabudget.com/v1#/Categories> for more information.

=cut

=method id

=cut

has id => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

=method category_group_id

=cut

has category_group_id => (
    is  => 'ro',
    isa => 'Str',
);

=method name

=cut

has name => (
    is  => 'ro',
    isa => 'Str',
);

=method hidden

=cut

has hidden => (
    is  => 'ro',
    isa => 'Bool',
);

=method note

=cut

has note => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

=method budgeted

=cut

has budgeted => (
    is  => 'ro',
    isa => 'Int',
);

=method activity

=cut

has activity => (
    is  => 'ro',
    isa => 'Int',
);

=method balance

=cut

has balance => (
    is  => 'ro',
    isa => 'Int',
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
