#!/usr/bin/perl

package Fibonacci 1.0;

use strict;
use warnings;

use English '-no_match_vars';

=head1 NAME

fibonacci - an example of dumb recursive programming

=head1 SYNOPSIS

./fibonacci [ nn ]

=head1 DESCRIPTION

Provides a script/function to calculate terms of the Fibonacci series.

This is a simple, elegant but deceptive example of the power of recursion.
During the calculation of F(n), F(1) is calculated not once, but F(n) times.

At a guess, the time complexity is exponential or O(c**n) where c is 1.6180... (otherwise known as the golden ratio).

=head1 EXAMPLES

    $ ./fibonacci.pm

will print the first few terms of the series: 1 1 2 3 5 8 13 21 34 55 89 144

    $ ./fibonacci.pm 16

will print the 16th term:  987

=head1 AUTHOR, COPYRIGHT and LICENCE

    New Forester <NewForester@users.noreply.github.com>
    MIT Licence @ https://opensource.org/licenses/MIT

=cut

=head1 ROUTINES

=head2 fibonacci(nth)

    Calculate the nth term of the Fibonacci series

    Parameters - nth (integer) - the term to calculate

    Return - (integer) - the nth term
=cut

sub fibonacci
{
    my $nth = shift;

    return $nth if $nth < 2;

    return fibonacci($nth - 1) + fibonacci($nth - 2);
}

# ------------------------------

my $name = $English::PROGRAM_NAME;

if ($name =~ m{/fibonacci.pm})
{
    if (scalar @ARGV)
    {
        # Print the nth Fibonacci number calculated using recursion

        printf "%d\n", fibonacci $ARGV[0];
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
