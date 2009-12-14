use strict;
use warnings;
use Test::More;

plan skip_all => "Preconditions failed; your filesystem is strange"
  unless -d "/etc" && -e "/etc/passwd";

use MooseX::Types::Path::Class qw(ExistingFile ExistingDir);

ok is_ExistingFile(to_ExistingFile("/etc/passwd")), '/etc/passwd is an existing file';

ok is_ExistingDir(to_ExistingDir("/etc/")), '/etc/ is an existing directory';

done_testing;
