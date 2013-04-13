# NAME

Benchmark::Confirm - take a Benchmark and confirm returned values



# SYNOPSIS

for example, it is ordinary to execute benchmark script...

    perl some_benchmark.pl

and use Benchmark::Confirm

    perl -MBenchmark::Confirm some_benchmark.pl

then you get the result of benchmark and the confirmination.

    Benchmark: timing 1 iterations of Name1, Name2, Name3...
         Name1:  0 wallclock secs ( 0.00 usr +  0.00 sys =  0.00 CPU)
                (warning: too few iterations for a reliable count)
         Name2:  0 wallclock secs ( 0.00 usr +  0.00 sys =  0.00 CPU)
                (warning: too few iterations for a reliable count)
         Name3:  0 wallclock secs ( 0.00 usr +  0.00 sys =  0.00 CPU)
                (warning: too few iterations for a reliable count)
                        Rate Name3 Name1 Name2
    Name3 10000/s    --    0%    0%
    Name1 10000/s    0%    --    0%
    Name2 10000/s    0%    0%    --
    ok 1
    ok 2
    ok 3
    1..3

See the last 4 lines, these are the result of confirmation.



# DESCRIPTION

__Benchmark::Confirm__ displays a confirmation after benchmarks that the each values from benchmark codes are equivalent or not.

All you have to do is to use `Benchmark::Confirm` instead of `Benchmark`.

However, if you write some benchmarks in the one script, you should call some methods from `Benchmark::Confirm`. for more details see below METHODS section.



# METHODS

See [Benchmark\#Standard\_Exports](http://search.cpan.org/perldoc?Benchmark\#Standard\_Exports) and [Benchmark\#Optional\_Exports](http://search.cpan.org/perldoc?Benchmark\#Optional\_Exports) sections.

Moreover, __atonce__ and __reset\_confirm__ these functions are only for `Benchmark::Confirm`.

## atonce

`atonce` function confirms values manually.

You can use this function when you write some benchmarks in one script. Or you shuld use `reset` function instead on between some benchmarks.

    use strict;
    use warnings;

    use Benchmark::Confirm qw/timethese/;

    {
        my $result = timethese( 1 => +{
            Name1 => sub { "something" },
            Name2 => sub { "something" },
            Name3 => sub { "something" },
        });
    }

    Benchmark::Confirm->atonce;

    {
        my $result = timethese( 1 => +{
            Name1 => sub { 1 },
            Name2 => sub { 1 },
            Name3 => sub { 1 },
        });
    }

## reset\_confirm

This function resets stacks of returned value.



# CAVEATS

If benchmark code returns CODE reference, then `Benchmark::Confirm` treats it as string value: 'CODE'. This may change in future releases.



# REPOSITORY

Benchmark::Confirm is hosted on github
<http://github.com/bayashi/Benchmark-Confirm>



# AUTHOR

Dai Okabayashi <bayashi@cpan.org>



# SEE ALSO

[Benchmark](http://search.cpan.org/perldoc?Benchmark)



# LICENSE

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See [perlartistic](http://search.cpan.org/perldoc?perlartistic).
