use warnings FATAL => 'all';
use strict;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'MooseX::Types::Path::Class',
    license             => 'perl',
    dist_author         => 'Todd Hepler <thepler@employees.org>',
    dist_version_from   => 'lib/MooseX/Types/Path/Class.pm',
    requires => {
        'MooseX::Types'  => 0.04,
        'MooseX::Getopt' => 0.05,
        'Path::Class'    => 0.16,
    },
    optional => {
    },
    build_requires => {
        'Test::More'     => 0,
    },
    add_to_cleanup      => [ 'MooseX-Types-Path-Class-*' ],
);

$builder->create_build_script();
