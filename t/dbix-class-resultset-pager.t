use strict;
use warnings;

use Test::More;
use Test::Needs 'DBIx::Class::ResultSet::Pager';
use Test::Fatal;

is(
    exception {
        my $pager = DBIx::Class::ResultSet::Pager->new(
            sub { 10 },  #lazy-get the total
            2,
            3,
        );

        is($pager->next_page, 4, 'next page');
        is($pager->last_page, 5, '10 rows at 2 per page = 5 pages');
    },
    undef,
    'DBIx::Class is happy',
);

done_testing;
