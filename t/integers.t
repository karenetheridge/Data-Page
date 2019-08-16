use strict;
use warnings;
use Test::More;
use Test::Fatal;
use Data::Page;

my $pager = Data::Page->new;
foreach my $field (qw(entries_per_page current_page total_entries)) {
    like(
        exception { $pager->$field(undef) },
        qr/$field must be an integer/,
        'cannot set '.$field.' to undef',
    );

    like(
        exception { $pager->$field({}) },
        qr/$field must be an integer/,
        'cannot set '.$field.' to a reference',
    );

    like(
        exception { $pager->$field(3.14) },
        qr/$field must be an integer/,
        'cannot set '.$field.' to a float',
    );
}

done_testing;
