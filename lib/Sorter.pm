package Sorter;

use strict;
use warnings;

sub new {
    bless {list=>[]}, shift;
}

sub set_values {
    my $self = shift;
    $self->{list} = \@_;
}

sub get_values {
    my $self = shift;
    my $list = $self->{list};
    return @$list;
}

sub _swap {
    my ($a, $b) = @_;
    my $tmp = $$a;
    $$a = $$b;
    $$b = $tmp;
}

sub _sort {
    my ($self, $start, $end) = @_;
    
}

sub sort {
    
}

1;
