
use warnings FATAL => 'all';
use strict;

package Foo;
use Moose;
with 'MooseX::Getopt';
use MooseX::Types::Path::Class;

has 'dir' => (
    is       => 'ro',
    isa      => 'Path::Class::Dir',
    required => 1,
    coerce   => 1,
);

has 'file' => (
    is       => 'ro',
    isa      => 'Path::Class::File',
    required => 1,
    coerce   => 1,
);

package Bar;
use Moose;
with 'MooseX::Getopt';
use MooseX::Types::Path::Class qw( Dir File );

has 'dir' => (
    is       => 'ro',
    isa      => Dir,
    required => 1,
    coerce   => 1,
);

has 'file' => (
    is       => 'ro',
    isa      => File,
    required => 1,
    coerce   => 1,
);

package main;

use Test::More;
plan tests => 20;

my $check = sub {
    my $o = shift;
    isa_ok( $o->dir, 'Path::Class::Dir' );
    cmp_ok( $o->dir, 'eq', '/tmp', 'dir is /tmp' );
    isa_ok( $o->file, 'Path::Class::File' );
    cmp_ok( $o->file, 'eq', '/tmp/foo', 'file is /tmp/foo' );
};

for my $class (qw(Foo Bar)) {
    my $o;

    $o = $class->new( dir => '/tmp', file => [ '', 'tmp', 'foo' ] );
    isa_ok( $o, $class );
    $check->($o);
    @ARGV = qw(
        --dir
        /tmp
        --file
        /tmp/foo
    );
    $o = $class->new_with_options;
    isa_ok( $o, $class );
    $check->($o);
}

