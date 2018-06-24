package WWW::YNAB::ScheduledTransaction;
use Moose;

use Moose::Util::TypeConstraints qw(enum maybe_type);

has id => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has date_first => (
    is  => 'ro',
    isa => 'Str',
);

has date_next => (
    is  => 'ro',
    isa => 'Str',
);

has frequency => (
    is  => 'ro',
    isa => enum([qw(
        never daily weekly everyOtherWeek twiceAMonth every4Weeks
        monthly everyOtherMonth every3Months every4Months twiceAYear
        yearly everyOtherYear
    )]),
);

has amount => (
    is  => 'ro',
    isa => 'Int',
);

has memo => (
    is  => 'ro',
    isa => 'Maybe[Str]',
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
    traits  => ['Array'],
    is      => 'bare',
    isa     => 'ArrayRef[WWW::YNAB::ScheduledSubTransaction]',
    handles => {
        subtransactions => 'elements',
    }
);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
