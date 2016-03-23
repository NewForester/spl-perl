package Fibonacci 1.0;

use strict;
use warnings;

=head1 NAME

TestFibonacci - unit test for fibonacci.pm

=head1 SYNOPSIS

perl TestFibonacci.pm

=head1 DESCRIPTION

Verifies the fibonacci() function returns the correct value for
the first 10 terms of the Fibonacci series.

By induction, the function works for all other positive integers.

=head1 EXAMPLES

    $ perl TestFibonacci.pm

will print

    1..10
    ok 1 - 1st Fibonacci number
    ok 2 - 2nd Fibonacci number
    ok 3 - 3rd Fibonacci number
    ok 4 - 4th Fibonacci number
    ok 5 - 5th Fibonacci number
    ok 6 - 6th Fibonacci number
    ok 7 - 7th Fibonacci number
    ok 8 - 8th Fibonacci number
    ok 9 - 9th Fibonacci number
    ok 10 - 10th Fibonacci number

demonstrating all tests passed.

=head1 AUTHOR, COPYRIGHT and LICENCE

    New Forester <NewForester@users.noreply.github.com>
    MIT Licence @ https://opensource.org/licenses/MIT

=head1 ROUTINES

=cut

use Test::More;
use base 'Test::Class';

use fibonacci;

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

=head2 test_fibonacci

    The test case for fibonacci() in fibonacci.pm.

    Verifies the function for the first 10 terms of the Fibonacci series.
=cut

sub test_fibonacci : Tests(10)
{
    # print "test fibonacci()\n";

    my @umm = qw(th st nd rd);
    my ($nn, $mm) = (1, 0);

    for (my $ii = 1; $ii <= 10; $ii++)
    {
        my $cardinal = ($ii < 4) ? $ii : 0;

        is fibonacci($ii), $nn, "$ii$umm[$cardinal] Fibonacci number";

        ($nn, $mm) = ($nn+$mm, $nn);
    }

    return;
}

Test::Class->runtests;

1;

# EOF
