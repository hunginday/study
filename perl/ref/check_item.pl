#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Data::Dump qw(dump); # CPAN module
use v5.10;


my @skipper   = qw(blue_shirt hat jacket preserver sunscreen);
my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
my @gilligan  = qw(red_shirt hat lucky_socks water_bottle);

my %all = (
    Gilligan  => \@gilligan, 
    Skipper   => \@skipper, 
    Professor => \@professor,
);

check_items_for_all(\%all);

sub check_items_for_all {
    my $all_ref = shift;
    my %missing = ( );

    my @required = qw(preserver sunscreen water_bottle jacket);

    foreach my $person (keys %$all_ref) {
        for my $item (@required) {
            my %person_hash = map { $_ => 1 } @{ $all_ref->{$person} };
            unless ( $person_hash{$item} ) { # not found in list?
                print "$person is missing $item.\n";
                push @{ $missing{$person} }, $item;
            }
        }
        if (@{ $missing{$person} }) {
            print "Adding \"@{$missing{$person}}\" to \"@{ $all_ref->{$person} }\" for $person.\n";
            push @{ $all_ref->{$person} }, @{ $missing{$person} };
        }
    }
}

dump \%all;

# not used
sub check_required_items {
    my $who = shift;
    my $items = shift;
    my %whose_items = map { $_, 1 } @$items;
    my @required = qw(preserver sunscreen water_bottle jacket);
    my @missing = ( );

    for my $item (@required) {
        unless ( $whose_items{$item} ) { # not found in list?
            print "$who is missing $item.\n";
            push @missing, $item;
        }
    }
    if (@missing) {
        print "Adding @missing to @$items for $who.\n";
        push @$items, @missing;
    }
}