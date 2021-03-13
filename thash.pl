#!/usr/bin/perl
use lib '/home/robert';
use THash;
use strict;
use warnings;

tie my %hash, "THash", "one", "first entry";

$hash{"two"} = "second entry";
$hash{"three"} = "third entry";
$hash{"four"} = "forth entry";
$hash{"five"} = "fifth entry";
$hash{"six"} = "sixth entry";
$hash{"seven"} = "seventh entry";

foreach my $key (keys(%hash)) {
	print "$key => $hash{$key}\n";
}

my ($key, $value) = each(%hash);
print "$key: $value\n";

print "$hash{'six'}\n";

print "$hash{'third entry'}\n";
print "$hash{'forth entry'}\n";
print "$hash{'seventh entry'}\n";
print "$hash{'ninth entry'}\n";

print "$hash{'ninth'}\n";
print "$hash{'six'}\n";
print "$hash{'sixth entry'}\n";
print "$hash{'fifth entry'}\n";
