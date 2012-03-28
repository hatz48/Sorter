package Sorter;

use strict;
use warnings;

sub new {
    bless {list=>[]}, shift;
}

sub set_values {
    my $self = shift;
    my @list = @_; # いまだ配列とリストの違いがわかっていない。。
    $self->{list} = \@list;
    # push(@{$self->{list}}, @_);
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

sub _calc_pivot {
    my ($self, $start, $end) = @_;
    if ($self->{list}[$start] eq $self->{list}[$end]) { return $self->{list}[$start]; }
    my $sum = $self->{list}[$start] + $self->{list}[$end];
    return $sum < 0 ? int($sum / 2) - 1 : int($sum / 2);
    # my $mid = int(($start + $end) / 2);
    # return $self->{list}[$mid];
}

sub _sort {
    my ($self, $start, $end) = @_;
    if ($start == $end) { return; }
    my $pivot = $self->_calc_pivot($start, $end);
    my $list = $self->{list};
    my ($low, $high) = ($start, $end);
    while ($low < $high) {
        while (($list->[$low] <= $pivot) && ($low < $high)) { $low++; }
        while (($list->[$high] > $pivot) && ($low < $high)) { $high--; }
        ($list->[$low], $list->[$high]) = ($list->[$high], $list->[$low]);
    }
    $self->_sort($start, $low - 1);
    $self->_sort($low,   $end);
}

sub sort {
    my $self = shift;
    my $list = $self->{list};
    # my $length = @$list;
    my $length = $#$list;
    if ($length == -1) { return; }
    $self->_sort(0, $length);
}

1;
