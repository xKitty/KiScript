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


package XChat::KiScript;

use strict;
use Xchat qw( :all );
my $PKG = __PACKAGE__;
my $VERSION = "0.0";
my $REVISION = "0004";

Xchat::register("KiScript", "r$REVISION", "Kitty's XChat Script", "${PKG}::unload");

##These need to be fixed, upcoming rev
#Xchat::hook_server("PRIVMSG", "${PKG}::privmsghandler");
#Xchat::hook_server("NOTICE", "${PKG}::noticehandler");

Xchat::hook_command("AVATAR", "${PKG}::ctcpavatar");
Xchat::hook_command("CLIENTINFO", "${PKG}::ctcpclientinfo");
Xchat::hook_command("FINGER", "${PKG}::ctcpfinger");
Xchat::hook_command("PAGE", "${PKG}::ctcppage");
##ping needs to have a proper notice handler, done in script
##xchat does not recognize our ping sends, will be fixed in an upcoming rev
#Xchat::hook_command("PING", "${PKG}::ctcpping");
Xchat::hook_command("SOURCE", "${PKG}::ctcpsource");
Xchat::hook_command("TIME", "${PKG}::ctcptime");
Xchat::hook_command("USERINFO", "${PKG}::ctcpuserinfo");
Xchat::hook_command("VERSION", "${PKG}::ctcpversion");

sub ctcpavatar {
	Xchat::print("Nope, Chuck Testa!  (Not implemented yet.)");
}

sub ctcpclientinfo {
	my $target = $_[0][1];
	Xchat::print("Sending CTCP CLIENTINFO to $target");
	Xchat::command("QUOTE PRIVMSG $target :CLIENTINFO");
	return Xchat::EAT_ALL;
}

sub ctcpfinger {
	my $target = $_[0][1];
	Xchat::print("Sending CTCP FINGER to $target");
	Xchat::command("QUOTE PRIVMSG $target :FINGER");
	return Xchat::EAT_ALL;
}

sub ctcpping {
##Needs to save the timestamp and wait for a reply
	my $target = $_[0][1];
	my @time = localtime(time);
	my $timestamp = "@time[5]@time[4]@time[3]@time[2]@time[1]@time[0]";
	Xchat::print("Sending CTCP PING to $target");
	Xchat::command("QUOTE PRIVMSG $target :PING $timestamp");
	return Xchat::EAT_ALL;
}

sub ctcppage {
	##Needs to send an actual page
	my $target = $_[0][1];
	my $message = $_[1][2];
	Xchat::print("Sending CTCP PAGE to $target ($message)");
	Xchat::command("QUOTE PRIVMSG $target :PAGE $message");
	return Xchat::EAT_ALL;
}

sub ctcpsource {
	my $target = $_[0][1];
	Xchat::print("Sending CTCP SOURCE to $target");
	Xchat::command("QUOTE PRIVMSG $target :SOURCE");
	return Xchat::EAT_ALL;
}

sub ctcptime {
	my $target = $_[0][1];
	Xchat::print("Sending CTCP TIME to $target");
	Xchat::command("QUOTE PRIVMSG $target :TIME");
	return Xchat::EAT_ALL;
}

sub ctcpuserinfo {
	my $target = $_[0][1];
	Xchat::print("Sending CTCP USERINFO to $target");
	Xchat::command("QUOTE PRIVMSG $target :USERINFO");
	return Xchat::EAT_ALL;
}

sub ctcpversion {
	my $target = $_[0][1];
	Xchat::print("Sending CTCP VERSION to $target");
	Xchat::command("QUOTE PRIVMSG $target :VERSION");
	return Xchat::EAT_ALL;
}

sub privmsghandler {
	my $raw = shift;
	my @rawarray = split(' ', $raw);
	if (@rawarray[3] =~ /:/) {
		my @raw2 = split('', $raw);
		## Source from the person, not the medium.
		Xchat::print("CTCP to	 @rawarray[2], DATA: @raw2[1]");
		my @notgood = split(' ', @raw2[1]);
		if (@notgood[0] =~ "PING") {
			Xchat::print("u r ping bro");
		}
	}
}

sub noticehandler {}

sub parsetm {
	
}
sub unload {
	Xchat::print("13Ki09Script by 13Kitty Unloaded");
}

Xchat::print("13Ki09Script by 13Kitty Loaded (v$VERSION r$REVISION)");

