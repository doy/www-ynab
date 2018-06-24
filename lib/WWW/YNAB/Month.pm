package WWW::YNAB::Month;
use Moose;

has month => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has note => (
    is  => 'ro',
    isa => 'Maybe[Str]',
);

has to_be_budgeted => (
    is  => 'ro',
    isa => 'Maybe[Int]',
);

has age_of_money => (
    is  => 'ro',
    isa => 'Maybe[Int]',
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
