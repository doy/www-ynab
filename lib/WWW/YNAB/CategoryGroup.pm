package WWW::YNAB::CategoryGroup;
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

has hidden => (
    is  => 'ro',
    isa => 'Bool',
);

has deleted => (
    is  => 'ro',
    isa => 'Bool',
);

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
