package WWW::YNAB::ModelHelpers;

use Moose::Role;

sub model_from_data {
    my $self = shift;
    my ($class, $data, $server_knowledge) = @_;

    my @init_args = grep {
        $_ !~ /^_/
    } map {
        $_->init_arg
    } $class->meta->get_all_attributes;

    my %args = map {
        $_ => $data->{$_}
    } grep {
        exists $data->{$_}
    } @init_args;

    if (defined $server_knowledge) {
        $args{server_knowledge} = $server_knowledge;
    }

    $class->new(%args, _ua => $self->_ua);
}

no Moose::Role;

=begin Pod::Coverage

  model_from_data

=end Pod::Coverage

=cut

1;
