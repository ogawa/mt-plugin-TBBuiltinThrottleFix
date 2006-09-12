# TBBuiltinThrottleFix - A apche for MT::App::Trackback::_builtin_throttle.
#
# $Id$
#
# This software is provided as-is. You may use it for commercial or 
# personal use. If you distribute it, please keep this notice intact.
#
# Copyright (c) 2006 Hirotaka Ogawa

package MT::Plugin::TBBuiltinThrottleFix;
use strict;
use MT;
use base 'MT::Plugin';

our $VERSION = '0.01';
my $plugin = __PACKAGE__->new({
    name => 'TBBuiltinThrottleFix Plugin',
    description => 'A patch for MT::App::Trackback::_builtin_throttle.',
    doc_link => 'http://code.as-is.net/wiki/TBBuiltinThrottleFix_Plugin',
    author_name => 'Hirotaka Ogawa',
    author_link => 'http://profile.typekey.com/ogawa/',
    version => $VERSION,
});
MT->add_plugin($plugin);

use MT::App::Trackback;
use MT::Util qw(offset_time_list);
no warnings 'redefine';
*MT::App::Trackback::_builtin_throttle = sub {
    my ($eh, $app, $tb) = @_;
    my $user_ip = $app->remote_ip;

    my @ts = offset_time_list(time - 3600, $tb->blog_id);
    my $from = sprintf("%04d%02d%02d%02d%02d%02d",
                       $ts[5]+1900, $ts[4]+1, @ts[3,2,1,0]);
    require MT::TBPing;
    my $count = MT::TBPing->count({ blog_id => $tb->blog_id,
                                    ip => $user_ip,
                                    created_on => [$from] },
                                  { range => {created_on => 1} });
    return 0 if $count >= $app->config('OneHourMaxPings');

    @ts = offset_time_list(time - 86400, $tb->blog_id);
    $from = sprintf("%04d%02d%02d%02d%02d%02d",
                    $ts[5]+1900, $ts[4]+1, @ts[3,2,1,0]);
    $count = MT::TBPing->count({ blog_id => $tb->blog_id,
                                 ip => $user_ip,
                                 created_on => [$from] },
                               { range => {created_on => 1} });
    return 0 if $count >= $app->config('OneDayMaxPings');

    return 1;
};

1;
