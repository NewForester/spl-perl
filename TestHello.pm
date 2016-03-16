package Hello 1.0;

use strict;
use warnings;

=head1 NAME

TestHello - unit test for hello.pm

=head1 SYNOPSIS

perl TestHello.pm

=head1 DESCRIPTION

This is a simple unit test for hello.pm written with a view to
 - checking that Test::Class is installed properly;
 - providing a simple starting point for writing other unit tests in perl.

=head1 EXAMPLES

    $ perl TestHello.pm

will print

    1..2
    ok 1 - greet Paul
    ok 2 - greet Heather

demonstrating all (both) tests passed.

=head1 AUTHOR, COPYRIGHT and LICENCE

    New Forester <NewForester@users.noreply.github.com>
    MIT Licence @ https://opensource.org/licenses/MIT

=head1 ROUTINES

=cut

use Test::More;
use base 'Test::Class';

use hello;

=head2 make_fixture

    Called before calling each test case routine.

    Performs any necessary pre-test set up.
=cut

sub make_fixture : Tests(setup)
{
    # print "Setup\n";

    return;
}

=head2 teardown

    Called after calling each test case routine.

    Performs any necessary post-test clean up and shut down.
=cut

sub teardown : Tests(teardown)
{
    #  print "Teardown\n";

    return;
}

=head2 test_hello

    The test case for greet() in hello.pm.

    Two simple tests.
=cut

sub test_hello : Tests(2)
{
    # print "test hello()\n";

    is greet('Paul'),    'Hello Paul',    'greet Paul';
    is greet('Heather'), 'Hello Heather', 'greet Heather';

    return;
}

Test::Class->runtests;

1;

# EOF
