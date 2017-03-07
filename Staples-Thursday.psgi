use lib 'lib';
use Staples::Thursday;
use Plack::Builder;

my $handler = sub { Staples::Thursday->run_psgi(@_) };

builder {
    mount '/' => $handler,
}
