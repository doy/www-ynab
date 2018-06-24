package WWW::YNAB::User;

use Moose;
# ABSTRACT: User model object

=head1 SYNOPSIS

  use WWW::YNAB;

  my $ynab = WWW::YNAB->new(...);
  my $user = $ynab->user;

=head1 OVERVIEW

See L<https://api.youneedabudget.com/v1#/User> for more information.

=cut

=method id

=cut

has id => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
