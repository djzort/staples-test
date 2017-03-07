#!/usr/bin/env perl
# vim: softtabstop=4 tabstop=4 shiftwidth=4 ft=perl expandtab smarttab
# ABSTRACT: Next Thursday via Plack

use strict;
use warnings;

package Staples::Thursday;

use DateTime;
use Encode;
use Plack::Request;

{

my $desired_dow = 4;

sub _next_thursday {
    my $dt = DateTime->today();
    $dt->add(days => ($desired_dow - $dt->day_of_week) % 7);
    return $dt->ymd();
}

}

sub run_psgi {

    my $c = shift;
    my $env = shift;
    my $req = Plack::Request->new($env);

    my $res = $req->new_response( 200 );
    $res->content_type('text/plain; charset=utf-8');
    $res->body(Encode::encode('utf8', _next_thursday() ));

    return $res->finalize

}
