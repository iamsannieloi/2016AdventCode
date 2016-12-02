#!/usr/bin/perl

use strict;
use warnings;
use Test::More;

my $up = {
	1 => 1,
	2 => 2,
	3 => 3,
	4 => 1,
	5 => 2,
	6 => 3,
	7 => 4,
	8 => 5,
	9 => 6,
};

my $down = {
	1 => 4,
	2 => 5,
	3 => 6,
	4 => 7,
	5 => 8,
	6 => 9,
	7 => 7,
	8 => 8,
	9 => 9,
};

my $left = {
	1 => 1,
	2 => 1,
	3 => 2,
	4 => 4,
	5 => 4,
	6 => 5,
	7 => 7,
	8 => 7,
	9 => 8,
};

my $right = {
	1 => 2,
	2 => 3,
	3 => 3,
	4 => 5,
	5 => 6,
	6 => 6,
	7 => 8,
	8 => 9,
	9 => 9,
};

open(DATA, "<day2.txt");
my $position = 5;
my $code;
while(<DATA>){
	my @steps = split('', $_);
	foreach my $move (@steps) {
		if ($move eq "U") {
			$position = $up->{$position};
		} elsif ($move eq "D") {
			$position = $down->{$position};
		} elsif ($move eq "L") {
			$position = $left->{$position};
		} elsif ($move eq "R") {
			$position = $right->{$position};
		}
	}
	$code .= $position;
}
print "$code\n";