package WWW::YNAB::Account;
use Moose;

use Moose::Util::TypeConstraints qw(enum);

with 'WWW::YNAB::ModelHelpers';

has id => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has name => (
    is  => 'ro',
    isa => 'Str',
);

has type => (
    is  => 'ro',
    isa => enum([
        qw(checking savings cash creditCard lineOfCredit
           otherAsset otherLiability payPal merchantAccount
           investmentAccount mortgage)
    ]),
);

has on_budget => (
    is  => 'ro',
    isa => 'Bool',
);

has closed => (
    is  => 'ro',
    isa => 'Bool',
);

has note => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

has balance => (
    is  => 'ro',
    isa => 'Int',
);

has cleared_balance => (
    is  => 'ro',
    isa => 'Int',
);

has uncleared_balance => (
    is  => 'ro',
    isa => 'Int',
);

has deleted => (
    is  => 'ro',
    isa => 'Bool',
);

has _ua => (
    is       => 'ro',
    isa      => 'WWW::YNAB::UA',
    required => 1,
);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
