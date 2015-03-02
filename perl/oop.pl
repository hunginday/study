#!/usr/bin/perl
use strict;
use warnings;

require Animal;

# Create a hash ref
my $animal = {
    "legs"   => 4,
    "colour" => "brown",
};                       # $animal is an ordinary hash reference

print ref $animal;       # "HASH"
bless $animal, "Animal"; # now it is an object of class "Animal"
print ref $animal;       # "Animal"

print $animal->can_eat("banana");
