use strict;
use warnings;

use Test::More tests => 2;
use Plack::Test;

require_ok('Staples::Thursday')
    or die "# Staples::Thursday not available\n";

my $answer =  Staples::Thursday::_next_thursday();

use HTTP::Request::Common;
test_psgi( sub { Staples::Thursday->run_psgi(@_) }, sub {
  my $cb = shift;
  my $res = $cb->(GET '/');
  is $res->content, $answer
});
