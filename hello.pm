#!/usr/bin/perl

package Hello 1.0;

use strict;
use warnings;

use English '-no_match_vars';

=head1 NAME

hello - a simple, testable, routine inspired by Hello World

=head1 SYNOPSIS

./hello.pm [ who-to-greet ... ]

=head1 DESCRIPTION

This is a simple script wrapped around a simple routine written with a view to
 - checking that perl, perldoc, Test::Class and Perl::Lint are installed properly;
 - providing a simple starting point for writing other scripts in perl.

=head1 EXAMPLES

    $ ./hello.pm

will print "Hello World".

    $ ./hello.pm Everybody

will print "Hello Everybody".

    $ ./hello.pm One and All

will print

    Hello One
    Hello and
    Hello All

=head1 AUTHOR, COPYRIGHT and LICENCE

    New Forester <NewForester@users.noreply.github.com>
    MIT Licence @ https://opensource.org/licenses/MIT

=head1 ROUTINES

=head2 greet(who)

    Greet someone or something

    Parameters - (string) - who or what to greet

    Return - (string) - greeting

=cut

sub greet
{
    return "Hello $_[0]";
}

# ------------------------------

my $name = $English::PROGRAM_NAME;

if ($name =~ m{/hello.pm})
{
    if (scalar @ARGV)
    {
        # Greet everyone on the command line

        foreach (@ARGV)
        {
            print greet "$_\n";
        }
    }
    else
    {
        # Greet the entire world

        print greet "World\n";
    }
}
else
{
    return 1;
}

# EOF
