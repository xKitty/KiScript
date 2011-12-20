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
my $XCHATVER = IRC::get_info(0);
my $VERSION = "0.0";
my $REVISION = "0003";

Xchat::register("KiScript", "r$REVISION", "Kitty's XChat Script", "${PKG}::unload");

IRC::add_message_handler("PRIVMSG", "${PKG}::privmsghandler");
IRC::add_message_handler("NOTICE", "${PKG}::noticehandler");

IRC::add_command_handler("AVATAR", "${PKG}::ctcpavatar");
IRC::add_command_handler("CLIENTINFO", "${PKG}::ctcpclientinfo");
IRC::add_command_handler("FINGER", "${PKG}::ctcpfinger");
IRC::add_command_handler("PAGE", "${PKG}::ctcppage");
##ping needs to have a proper notice handler, done in script
##xchat does not recognize our ping sends, will be fixed in next rev
#IRC::add_command_handler("PING", "${PKG}::ctcpping");
IRC::add_command_handler("SOURCE", "${PKG}::ctcpsource");
IRC::add_command_handler("TIME", "${PKG}::ctcptime");
IRC::add_command_handler("USERINFO", "${PKG}::ctcpuserinfo");
IRC::add_command_handler("VERSION", "${PKG}::ctcpversion");

sub ctcpavatar {
	IRC::print("Nope, Chuck Testa!  (Not implemented yet.)");
}

sub ctcpclientinfo {
	my $target = @_[0];
	IRC::print("Sending CTCP CLIENTINFO to $target");
	IRC::send_raw("PRIVMSG $target :CLIENTINFO");
	return Xchat::EAT_ALL;
}

sub ctcpfinger {
	my $target = @_[0];
	IRC::print("Sending CTCP FINGER to $target");
	IRC::send_raw("PRIVMSG $target :FINGER");
	return Xchat::EAT_ALL;
}

sub ctcpping {
##Needs to save the timestamp and wait for a reply
	my $target = @_[0];
	my @time = localtime(time);
	my $timestamp = "@time[5]@time[4]@time[3]@time[2]@time[1]@time[0]";
	IRC::print("Sending CTCP PING to $target");
	IRC::send_raw("PRIVMSG $target :PING $timestamp");
	return Xchat::EAT_ALL;
}

sub ctcppage {
	##Needs to send an actual page
	my $target = @_[0];
	IRC::print("Sending CTCP PAGE to $target");
	IRC::send_raw("PRIVMSG $target :PAGE");
	return Xchat::EAT_ALL;
}

sub ctcpsource {
	my $target = @_[0];
	IRC::print("Sending CTCP SOURCE to $target");
	IRC::send_raw("PRIVMSG $target :SOURCE");
	return Xchat::EAT_ALL;
}

sub ctcptime {
	my $target = @_[0];
	IRC::print("Sending CTCP TIME to $target");
	IRC::send_raw("PRIVMSG $target :TIME");
	return Xchat::EAT_ALL;
}

sub ctcpuserinfo {
	my $target = @_[0];
	IRC::print("Sending CTCP USERINFO to $target");
	IRC::send_raw("PRIVMSG $target :USERINFO");
	return Xchat::EAT_ALL;
}

sub ctcpversion {
	my $target = @_[0];
	IRC::print("Sending CTCP VERSION to $target");
	IRC::send_raw("PRIVMSG $target :VERSION");
	return Xchat::EAT_ALL;
}

sub privmsghandler {
	my $raw = shift;
	my @rawarray = split(' ', $raw);
	if (@rawarray[3] =~ /:/) {
		my @raw2 = split('', $raw);
		## Source from the person, not the medium.
		IRC::print("CTCP to	 @rawarray[2], DATA: @raw2[1]");
		my @notgood = split(' ', @raw2[1]);
		if (@notgood[0] =~ "PING") {
			IRC::print("u r ping bro");
		}
	}
}

sub noticehandler {}

sub parsetm {
	
}
sub unload {
	IRC::print("13Ki09Script by 13Kitty Unloaded");
}

IRC::print("13Ki09Script by 13Kitty Loaded (v$VERSION r$REVISION)");

