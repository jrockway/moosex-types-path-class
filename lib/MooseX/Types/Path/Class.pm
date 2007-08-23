package MooseX::Types::Path::Class;

use warnings FATAL => 'all';
use strict;

our $VERSION = '0.01';

use MooseX::Getopt;
use Path::Class ();

use MooseX::Types
    -declare => [qw( Dir File )];

use MooseX::Types::Moose qw(Object Str ArrayRef);

subtype Dir,
    as Object, where { $_->isa('Path::Class::Dir') };

coerce Dir,
    from Str,      via { Path::Class::Dir->new($_) },
    from ArrayRef, via { Path::Class::Dir->new(@$_) };

MooseX::Getopt::OptionTypeMap->add_option_type_to_map(
    Dir, '=s',
);


subtype 'Path::Class::Dir',
    as Object, where { $_->isa('Path::Class::Dir') };

coerce 'Path::Class::Dir',
    from Str,      via { Path::Class::Dir->new($_) },
    from ArrayRef, via { Path::Class::Dir->new(@$_) };

MooseX::Getopt::OptionTypeMap->add_option_type_to_map(
    'Path::Class::Dir', '=s',
);


subtype File,
    as Object, where { $_->isa('Path::Class::File') };

coerce File,
    from Str,      via { Path::Class::File->new($_) },
    from ArrayRef, via { Path::Class::File->new(@$_) };

MooseX::Getopt::OptionTypeMap->add_option_type_to_map(
    File, '=s',
);


subtype 'Path::Class::File',
    as Object, where { $_->isa('Path::Class::File') };

coerce 'Path::Class::File',
    from Str,      via { Path::Class::File->new($_) },
    from ArrayRef, via { Path::Class::File->new(@$_) };

MooseX::Getopt::OptionTypeMap->add_option_type_to_map(
    'Path::Class::File', '=s',
);


1;
__END__

=head1 NAME

MooseX::Types::Path::Class - A Path::Class type library for Moose


=head1 SYNOPSIS

  package MyClass;
  use Moose;
  use MooseX::Types::Path::Class qw( Dir File );
  with 'MooseX::Getopt';      # if you want the Getopt Role

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

  # these attributes are coerced to the
  # appropriate Path::Class objects
  Foo->new( dir => '/some/directory/', file => '/some/file' );

  
=head1 DESCRIPTION

This is a utility that creates common L<Moose> subtypes, coercions and
option specifications useful for dealing with L<Path::Class> objects
as L<Moose> attributes.

This module constructs coercions (see L<Moose::Util::TypeConstraints>)
from both 'Str' and 'ArrayRef' to both L<Path::Class::Dir> and
L<Path::Class::File> objects.  It also adds the Getopt option type
("=s") for both L<Path::Class::Dir> and L<Path::Class::File>
(see L<MooseX::Getopt>).

This is just meant to be a central place for these constructs, so you
don't have to worry about whether they've been created or not, and you're
not tempted to copy them into yet another class (like I was).

=head1 EXPORTS

See L<MooseX::Types> for how these exports work.

=over

=item Dir is_Dir to_Dir

=item File is_File to_File

=back


=head1 DEPENDENCIES

L<Moose>, L<MooseX::Types>, L<MooseX::Getopt>, L<Path::Class>


=head1 BUGS AND LIMITATIONS

No bugs have been reported.


=head1 AUTHOR

Todd Hepler  C<< <thepler@employees.org> >>


=head1 LICENCE AND COPYRIGHT

Copyright (c) 2007, Todd Hepler C<< <thepler@employees.org> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


