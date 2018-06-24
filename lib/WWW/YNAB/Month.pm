package WWW::YNAB::Month;

use Moose;
# ABSTRACT: Month model object

=head1 SYNOPSIS

  use WWW::YNAB;

  my $ynab = WWW::YNAB->new(...);
  my @budgets = $ynab->budgets;
  my $month = $budgets[0]->month('2018-06-01');

=head1 OVERVIEW

See L<https://api.youneedabudget.com/v1#/Months> for more information.

=cut

=method month

=cut

has month => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

=method note

=cut

has note => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

=method to_be_budgeted

=cut

has to_be_budgeted => (
    is  => 'ro',
    isa => 'Maybe[Int]',
);

=method age_of_money

=cut

has age_of_money => (
    is  => 'ro',
    isa => 'Maybe[Int]',
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
