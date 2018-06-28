package WWW::YNAB::Account;


use 5.010;
use Moose;
# ABSTRACT: Account model object

use Moose::Util::TypeConstraints qw(enum);

with 'WWW::YNAB::ModelHelpers';

=head1 SYNOPSIS

  use WWW::YNAB;

  my $ynab = WWW::YNAB->new(...);
  my @budgets = $ynab->budgets;
  my $account = $budgets[0]->account('12345678-1234-1234-1234-1234567890ab');

=head1 OVERVIEW

See L<https://api.youneedabudget.com/v1#/Accounts> for more information.

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

=method type

=cut

has type => (
    is  => 'ro',
    isa => enum([
        qw(checking savings cash creditCard lineOfCredit
           otherAsset otherLiability payPal merchantAccount
           investmentAccount mortgage)
    ]),
);

=method on_budget

=cut

has on_budget => (
    is  => 'ro',
    isa => 'Bool',
);

=method closed

=cut

has closed => (
    is  => 'ro',
    isa => 'Bool',
);

=method note

=cut

has note => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

=method balance

=cut

has balance => (
    is  => 'ro',
    isa => 'Int',
);

=method cleared_balance

=cut

has cleared_balance => (
    is  => 'ro',
    isa => 'Int',
);

=method uncleared_balance

=cut

has uncleared_balance => (
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
