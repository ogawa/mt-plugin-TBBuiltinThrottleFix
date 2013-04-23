# TBBuiltinThrottleFix Plugin

A patch for MT::App::Trackback::_builtin_throttle.

## Changes

 * 0.01(2006-09-12):
   * First release.

## Overview

Built-in throttling mechanism for Movable Type 3.x Trackback seems to be awksome, at least for me.  Becuase,

 * it does not check IP addresses, where trackback pings are sent from,
 * and it does not properly compare !OneDayMaxPings with the count of pings in a day.

This plugin overwrites MT::App::Trackback::_builtin_throttle and fixes the abovementioned problems.

## Installation

To install this plugin, upload or copy 'TBBuiltinThrottleFix.pl' into your Movable Type's plugin directory.  After proper installation, you will see a new "TBBuiltinThrottleFix Plugin" listed on the Main Menu of your Movable Type.

After that, the patch enabled.

## See Also

## License

This code is released under the Artistic License. The terms of the Artistic License are described at [http://www.perl.com/language/misc/Artistic.html]().

## Author & Copyright

Copyright 2006, Hirotaka Ogawa (hirotaka.ogawa at gmail.com)
