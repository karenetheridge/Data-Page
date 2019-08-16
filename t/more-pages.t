use strict;
use warnings;
use Test::More;
use Data::Page;

{
    my $pager = Data::Page->new(5, 10, 1);
    is($pager->entries_on_this_page, 5, '5 entries on first page');

    $pager->current_page(0);
    is($pager->current_page, 1, 'current page cannot be set to before first page');

    $pager->current_page(2);
    is($pager->current_page, 1, 'current page cannot be set to after last page');
}

done_testing;
