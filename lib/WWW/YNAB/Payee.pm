package WWW::YNAB::Payee;
use Moose;

has id => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has name => (
    is  => 'ro',
    isa => 'Str',
);

has transfer_account_id => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

has deleted => (
    is  => 'ro',
    isa => 'Bool',
);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
