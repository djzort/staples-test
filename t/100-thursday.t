use strict;
use warnings;

use Test::More tests => 2;
use Time::Moment;

require_ok('Staples::Thursday')
    or die "# Staples::Thursday not available\n";


my %jump = (
1 => 3,
2 => 2,
3 => 1,
4 => 7,
5 => 6,
6 => 5,
7 => 4,
);

my $thursday;
{
   my $tm = Time::Moment->now();
   $tm = $tm->plus_days($jump{$tm->day_of_week});
   $thursday = sprintf( '%04d-%02d-%02d', $tm->year, $tm->month, $tm->day_of_month );
}

is( Staples::Thursday::_next_thursday(), $thursday, sprintf('Next Thursday is %s', $thursday) );

