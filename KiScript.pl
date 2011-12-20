#!/usr/bin/perl
# KiScript (Kitty's XChat Script) - xKitty @ Github
# - Main Script File
#
# You may use this script for any personal use that you may find.  This script
# is not to be used in any kind of commercial setting.  You may modify this
# script as much as you please.  You may redistribute the unmodified version of
# this script freely.  A modified version of this script may be distributed
# as long as it clearly states the original author and retains the same license.
# If you make a large amount of modifications to the script and you would like
# to distribute it under a different name, please contact the author for
# permission.  No matter the case, you may never sell this script or any
# modification of it for any price.  If you have bought this script, please
# seek a refund.
#
# This script can be found at https://github.com/xKitty/KiScript


package IRC::XChat::KiScript;

use strict;
use Xchat qw( :all );
my $PKG = __PACKAGE__;
my $VERSION = "0.0";
my $REVISION = "0002";

IRC::register("KiScript", "r$REVISION", "", "");

IRC::add_command_handler("TIME", "${PKG}::ctcptime");
IRC::add_command_handler("FINGER", "${PKG}::ctcpfinger");

sub ctcptime {
	my $target = @_[0];
	IRC::print("Sending CTCP TIME to $target");
	IRC::send_raw("PRIVMSG $target :TIME");
	return(1);
}

sub ctcpfinger {
	my $target = @_[0];
	IRC::print("Sending CTCP FINGER to $target");
	IRC::send_raw("PRIVMSG $target :FINGER");
	return(1);
}

IRC::print("13Ki09Script by 13Kitty Loaded (v$VERSION r$REVISION)");
