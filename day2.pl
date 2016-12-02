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

my $up2 = {
	1 => '1',
	2 => '2',
	3 => '1',
	4 => '4',
	5 => '5',
	6 => '2',
	7 => '3',
	8 => '4',
	9 => '9',
	A => '6',
	B => '7',
	C => '8',
	D => 'B'
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

my $down2 = {
	1 => '3',
	2 => '6',
	3 => '7',
	4 => '8',
	5 => '5',
	6 => 'A',
	7 => 'B',
	8 => 'C',
	9 => '9',
	A => 'A',
	B => 'D',
	C => 'C',
	D => 'D',
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

my $left2 = {
	1 => '1',
	2 => '2',
	3 => '2',
	4 => '3',
	5 => '5',
	6 => '5',
	7 => '6',
	8 => '7',
	9 => '8',
	A => 'A',
	B => 'A',
	C => 'B',
	D => 'D',
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
my $right2 = {
	1 => '1',
	2 => '3',
	3 => '4',
	4 => '4',
	5 => '6',
	6 => '7',
	7 => '8',
	8 => '9',
	9 => '9',
	A => 'B',
	B => 'C',
	C => 'C',
	D => 'D',
};

open(DATA, "<day2.txt");
my $position = 5;
my $position2 = 5;
my ($code, $code2);
while(<DATA>){
	my @steps = split('', $_);
	foreach my $move (@steps) {
		if ($move eq "U") {
			$position = $up->{$position};
			$position2 = $up2->{$position2};
		} elsif ($move eq "D") {
			$position = $down->{$position};
			$position2 = $down2->{$position2};
		} elsif ($move eq "L") {
			$position = $left->{$position};
			$position2 = $left2->{$position2};
		} elsif ($move eq "R") {
			$position = $right->{$position};
			$position2 = $right2->{$position2};
		}
	}
	$code .= $position;
	$code2 .= $position2;
}
print "$code\n";
print "$code2\n";