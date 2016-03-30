package Fibonacci 1.0;

use strict;
use warnings;

=head1 NAME

TestFibonacci - unit test for the Fibonacci package

=head1 SYNOPSIS

perl TestFibonacci.pm

=head1 DESCRIPTION

Verifies the fibonacci() function returns the correct value for
the first 10 terms of the Fibonacci series.

By induction, the function works for all other positive integers.

The test is run for two implementations of fibonacci():
 - exponential complexity (dumb implementation)
 - linear complexity (inspired by functional programming)

=head1 EXAMPLES

    $ perl TestFibonacci.pm

will print

    1..20

    Test exponential fibonacci algorithm ...
    ok 1 - 1st Fibonacci number
               ...
    ok 10 - 10th Fibonacci number

    Test linear fibonacci algorithm ...
    ok 11 - 1st Fibonacci number
               ...
    ok 20 - 10th Fibonacci number

demonstrating all tests passed.

=head1 AUTHOR, COPYRIGHT and LICENCE

    New Forester <NewForester@users.noreply.github.com>
    MIT Licence @ https://opensource.org/licenses/MIT

=head1 ROUTINES

=cut

use Test::More;
use base 'Test::Class';

use fib_exponential;
use fib_linear;

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

=head2 test_exponential_fibonacci

    The test case for fibonacci() in fib_exponential.pm.
=cut

sub test_exponential_fibonacci : Tests(10)
{
    run_test ('exponential fibonacci algorithm', \&Fibonacci::exponential);

    return;
}

=head2 test_linear_fibonacci

    The test case for fibonacci() in fib_linear.pm.
=cut

sub test_linear_fibonacci : Tests(10)
{
    run_test ('linear fibonacci algorithm', \&Fibonacci::linear);

    return;
}

=head2 run_test

    Run a simple test of an implementation of the Fibonacci series.

    Verifies the function under test returns the correct result for the first 10 terms of the series.
=cut

sub run_test
{
    my $msg = shift;
    my $fibonacci = shift;

    print "\nTest $msg ...\n";

    my @umm = qw(th st nd rd);
    my ($nn, $mm) = (1, 0);

    for (my $ii = 1; $ii <= 10; $ii++)
    {
        my $cardinal = ($ii < 4) ? $ii : 0;

        is $fibonacci->($ii), $nn, "$ii$umm[$cardinal] Fibonacci number";

        ($nn, $mm) = ($nn+$mm, $nn);
    }

    return;
}

Test::Class->runtests;

1;

# EOF
