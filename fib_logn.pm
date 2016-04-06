#!/usr/bin/perl

package Fibonacci 1.0;

use strict;
use warnings;

use English '-no_match_vars';

=head1 NAME

fib_logn - an example of recursive programming

=head1 SYNOPSIS

./fib_logn [ nn ]

=head1 DESCRIPTION

Provides a script/function to calculate terms of the Fibonacci series.

This example of the power of recursion has log(n) time complexity.
It takes advantage of the identities:

    F(2n-1) = F(n) * F(n) + F(n-1) * F(n-1)
    F(2n) = (2 * F(n-1) + F(n)) * F(n)

Deriving higher order terms by multiplication of lower order terms
instead of by addition implies better than linear performance.

=head1 EXAMPLES

    $ ./fib_logn.pm

will print the first few terms of the series: 1 1 2 3 5 8 13 21 34 55 89 144

    $ ./fib_logn.pm 16

will print the 16th term:  987

=head1 AUTHOR, COPYRIGHT and LICENCE

    New Forester <NewForester@users.noreply.github.com>
    MIT Licence @ https://opensource.org/licenses/MIT

=cut

=head1 ROUTINES

=head2 internal_logn(nth)

    Internal calculation of the nth term of the Fibonacci series

    Parameters - nth (integer) - the term to calculate

    Return - (integer, integer) - the nth and nth-1 terms
=cut

sub internal_logn
{
    my $nth = shift;
    my $odd = $nth % 2;
    my @acc;

    if ($nth == 1)
    {
        @acc = (0, 1);
    }
    elsif ($odd)
    {
        @acc = internal_logn(($nth - 1) / 2);
    }
    else
    {
        @acc = internal_logn($nth / 2);
    }

    @acc = ($acc[0]*($acc[0]+2*$acc[1]), $acc[0]*$acc[0]+$acc[1]*$acc[1]);

    if ($odd)
    {
        @acc = ($acc[0]+$acc[1], $acc[0]);
    }

    return @acc;
}

=head2 logn(nth)

    Calculate the nth term of the Fibonacci series

    Parameters - nth (integer) - the term to calculate

    Return - (integer) - the nth term
=cut

sub logn
{
    my $nth = shift;

    return $nth if $nth < 1;

    return (internal_logn $nth)[0];
}

# ------------------------------

my $name = $English::PROGRAM_NAME;

if ($name =~ m{/fib_logn.pm})
{
    if (scalar @ARGV)
    {
        # Print the nth Fibonacci number calculated using recursion

        printf "%d\n", logn $ARGV[0];
    }
    else
    {
        # Print the first few Fibonacci numbers using a loop

        my ($nn, $mm) = (1, 0);

        while ($nn < 100)
        {
            print "$nn ";
            ($nn, $mm) = ($nn+$mm, $nn);
        }
        print "$nn\n";
    }
}
else
{
    return 1;
}

# EOF
