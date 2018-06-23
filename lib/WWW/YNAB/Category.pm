package WWW::YNAB::Category;
use Moose;

has id => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has category_group_id => (
    is  => 'ro',
    isa => 'Str',
);

has name => (
    is  => 'ro',
    isa => 'Str',
);

has hidden => (
    is  => 'ro',
    isa => 'Bool',
);

has note => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

has budgeted => (
    is  => 'ro',
    isa => 'Int',
);

has activity => (
    is  => 'ro',
    isa => 'Int',
);

has balance => (
    is  => 'ro',
    isa => 'Int',
);

has deleted => (
    is  => 'ro',
    isa => 'Bool',
);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
