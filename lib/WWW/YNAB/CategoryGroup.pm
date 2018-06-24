package WWW::YNAB::CategoryGroup;

use Moose;
# ABSTRACT: CategoryGroup model object

=head1 SYNOPSIS

  use WWW::YNAB;

  my $ynab = WWW::YNAB->new(...);
  my @budgets = $ynab->budgets;
  my @category_groups = $budgets[0]->category_groups

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

=method deleted

=cut

has deleted => (
    is  => 'ro',
    isa => 'Bool',
);

=method categories

=cut

has categories => (
    traits  => ['Array'],
    is      => 'bare',
    isa     => 'ArrayRef[WWW::YNAB::Category]',
    handles => {
        categories => 'elements',
    }
);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
