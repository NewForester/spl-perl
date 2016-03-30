#!/usr/bin/perl

package Fibonacci 1.0;

use strict;
use warnings;

use English '-no_match_vars';

=head1 NAME

fib_linear - an example of recursive programming

=head1 SYNOPSIS

./fib_linear [ nn ]

=head1 DESCRIPTION

Provides a script/function to calculate terms of the Fibonacci series.

This example of the power of recursion has linear time complexity.
During the calculation of F(n), F(n-1), ... F(0) are each calculated only once.

This is not an example of tail recursion but it was inspired by the idea.

=head1 EXAMPLES

    $ ./fib_linear.pm

will print the first few terms of the series: 1 1 2 3 5 8 13 21 34 55 89 144

    $ ./fib_linear.pm 16

will print the 16th term:  987

=head1 AUTHOR, COPYRIGHT and LICENCE

    New Forester <NewForester@users.noreply.github.com>
    MIT Licence @ https://opensource.org/licenses/MIT

=cut

=head1 ROUTINES

=head2 internal_linear(nth)

    Internal calculation of the nth term of the Fibonacci series

    Parameters - nth (integer) - the term to calculate

    Return - (integer, integer) - the nth and nth-1 terms
=cut

sub internal_linear
{
    my $nth = shift;
    my @acc;

    if ($nth == 1)
    {
        @acc = (0, 1);
    }
    else
    {
        @acc = internal_linear($nth - 1);
    }

    return ($acc[0]+$acc[1], $acc[0]);
}

=head2 linear(nth)

    Calculate the nth term of the Fibonacci series

    Parameters - nth (integer) - the term to calculate

    Return - (integer) - the nth term
=cut

sub linear
{
    my $nth = shift;

    return $nth if $nth < 1;

    return (internal_linear $nth)[0];
}

# ------------------------------

my $name = $English::PROGRAM_NAME;

if ($name =~ m{/fib_linear.pm})
{
    if (scalar @ARGV)
    {
        # Print the nth Fibonacci number calculated using recursion

        printf "%d\n", linear $ARGV[0];
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
