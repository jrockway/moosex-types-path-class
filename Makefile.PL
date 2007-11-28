
use warnings FATAL => 'all';
use strict;
use inc::Module::Install;

name     'MooseX-Types-Path-Class';
all_from 'lib/MooseX/Types/Path/Class.pm';
license  'perl';

# prereqs
requires 'MooseX::Types'  => '0.04';
requires 'MooseX::Getopt' => '0.05';
requires 'Path::Class'    => '0.16';

# things the tests need
build_requires 'Test::More' => '0.62';

WriteAll();

