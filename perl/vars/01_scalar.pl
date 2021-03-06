#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use Camel;

#===== define some vars =============
my $whence = "hello";
my $moles = 10;
my $file = "/etc/temp.log";

my $state   = "hello scalars"; 
my @myarray = ("hello", "scalars");
my %myhash  = ("hello", "scalars");

sub mysub {
    return 1;
}
#====================================

my $answer = 42; # an integer
my $pi = 3.14159265; # a "real" number
my $avocados = 6.02e23; # scientific notation
my $pet = "Camel"; # string
my $sign = "I love my $pet"; # string with interpolation
my $cost = 'It costs $100'; # string without interpolation
my $thence = $whence; # another variable's value
my $salsa = $moles * $avocados; # a gastrochemical expression
my $exit = system("ls $file"); # numeric status of a command
my $cwd = `pwd`; # string output from a command

my $ary = \@myarray; # reference to a named array
my $hsh = \%myhash; # reference to a named hash
my $sub = \&mysub; # reference to a named subroutine

my $ary_ref = [1,2,3,4,5]; # reference to an unnamed array
my $hsh_ref = {Na => 19, Cl => 35}; # reference to an unnamed hash
my $sub_ref = sub { print $state }; # reference to an unnamed subroutine

my $fido = Camel->new("Amelia"); # reference to an object


#====================================

# ${days}               Same as $days but unambiguous before alphanumerics
# $Dog::days            Different $days variable, in the Dog package
# $#days                Last index of array @days
# $days–>[28]           29th element of array pointed to by reference $days
# $days[0][2]           Multidimensional array
# $days{2000}{"Feb"}    Multidimensional hash
# $days{2000,"Feb"}     Multidimensional hash emulation



print "end\n";
