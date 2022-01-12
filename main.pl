#!/usr/bin/perl
use strict;
use warnings;


# Parse all cracked passwords from hashcat logs


system("color E");
system("title HASHCAT Cracked Passwords Parser  -  Coded by DR4G0N5 !");
print "[~] Format HASH:PASSWORD\n\n";
print "[~] Cracked Hash File :> ";
chomp (my $file = <STDIN>);
open(my $fh, '<', $file) or die "Could not open file '$file' $!";

my $md5    = "01. MD5.txt";
my $sha1   = "02. SHA1.txt";
my $hex    = "03. HEX-To-Text.txt";
my $email  = "04. E-MAILS.txt";
my $long   = "05. PASSWORDS-LONG-32.txt";
my $rest   = "06. ALL-REST.txt";

open(my $fh_md5, '>>', $md5) or die "Could not open file '$md5' $!";
open(my $fh_sha1, '>>', $sha1) or die "Could not open file '$sha1' $!";
open(my $fh_hex, '>>', $hex) or die "Could not open file '$hex' $!";
open(my $fh_email, '>>', $email) or die "Could not open file '$email' $!";
open(my $fh_long, '>>', $long) or die "Could not open file '$long' $!";
open(my $fh_rest, '>>', $rest) or die "Could not open file '$rest' $!";

while (my $line = <$fh>) {
$_ = $line . "\n";
/(.*?):(.*?)\n/;
my $a = $1;
my $b = $2;
$a =~ s/^\s+//;
$a =~ s/\s+$//;
$b =~ s/^\s+//;
$b =~ s/\s+$//;
next if($b eq "");

if($b =~ /^\$HEX\[(.*?)\]$/i) {my $c = $1;$c =~ s/([a-fA-F0-9][a-fA-F0-9])/chr(hex($1))/eg;print $fh_hex "$c\n";}
elsif($b =~ /^([a-f0-9]{32})$/i) {my $d = $1;print $fh_md5 "$d\n";}
elsif($b =~ /^([a-f0-9]{40})$/i) {my $e = $1;print $fh_sha1 "$e\n";}
elsif($b =~ /^([A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4})$/i) {my $f = $1;print $fh_email "$f\n";}
elsif(length($b) >= 33){print $fh_long "$b\n";}else{print $fh_rest "$b\n";}}

close $fh_hex;
close $fh_md5;
close $fh_sha1;
close $fh_email;
close $fh_long;
close $fh_rest;

print "\n\n\n\n[ ! ] Done!\n";
sleep 5;
#EOF
