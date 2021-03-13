#!/usr/bin/perl
package THash;
use strict;
use warnings;

# constructor
sub TIEHASH {
	my $class = shift;
	my $key = shift;
	my $value = shift;
	my $self->{$key} = $value;	
	bless ($self, $class);
	return $self;
}
# FETCH this, key.
# return value
sub FETCH {
	#print "FETCH\n";
	my $self = shift;
	my $key = shift;
	if ($self->{$key}) {	
		return $self->{$key};
	} elsif (grep /^$key$/, values(%{$self})) {
		# search for corresponding key
		while (my ($lkey, $lvalue) = each (%{$self})) {
			return $lkey if $lvalue eq $key;
		}
	} else {
		# not found
		my $result = "\"$key\" does not exist";
		return $result;
	}
		
}

# FIRSTKEY this
sub FIRSTKEY {
	#print "FIRSTKEY\n";
	my $self = shift;
	# reset the hash iterator
	keys(%{$self});
	return scalar (each %{$self});
}

# NEXTKEY this
sub NEXTKEY {
	#print "NEXTKEY\n";
	my $self = shift;
	return each %{$self};
}

# EXISTS this, key|value
sub EXISTS {
	#print "EXISTS\n";
	my $self = shift;
	my $lkey = shift;
	if ($self->{$lkey}) {
		return 1;
	} elsif (grep /^$lkey$/, (values(%{$self}))) {
		return 1;
	} else {
		return undef;
	}
}
# STORE this, key, value
sub STORE {
	#print "STORE\n";
	my $self = shift,
	my $key = shift;
	my $value = shift;
	
	$self->{$key} = $value;
}
1;
