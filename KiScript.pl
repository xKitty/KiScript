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

my $VERSION = "0.0";
my $REVISION = "0001";

IRC::register ("KiScript", "r$REVISION", "", "");

IRC::print ("13Ki09Script Loaded (v$VERSION r$REVISION)");