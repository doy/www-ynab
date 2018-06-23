package WWW::YNAB::Transaction;
use Moose;

use Moose::Util::TypeConstraints qw(enum maybe_type);

has id => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has date => (
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

has cleared => (
    is  => 'ro',
    isa => enum([qw(cleared uncleared reconciled)]),
);

has approved => (
    is  => 'ro',
    isa => 'Bool',
);

has flag_color => (
    is  => 'ro',
    isa => maybe_type(enum([qw(red orange yellow green blue purple)])),
);

has account_id => (
    is  => 'ro',
    isa => 'Str',
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

has import_id => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

has deleted => (
    is  => 'ro',
    isa => 'Bool',
);

has account_name => (
    is  => 'ro',
    isa => 'Str',
);

has payee_name => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

has category_name => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

has subtransactions => (
    is  => 'ro',
    isa => 'ArrayRef[WWW::YNAB::SubTransaction]',
);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
