#!/usr/bin/perl -I..

use Net::ACAP;

# * ACAP IMPLEMENTATION("CMU ACAPD 1.0.0a1") CHARSET("utf-8")
# . login anon rob
# . OK Login completed
# . store "/addressbook" "foo" "bar" "baz" "qux" "quux"
# . OK Store completed
# . search "/addressbook" return ("entry" "bar" "qux") compare "entry"
# "+octet" ""
# . ENTRY {3}
# foo {3}
# foo {3}
# baz {4}
# quux
# . MODTIME "19970513182912"
# . OK Search completed
# . logout
# * BYE Cya later!
# . OK Logout completed 

my $host = 'acap.andrew.cmu.edu';

my $imap = new Net::ACAP($host, Debug => 1)
  or die("can't connect to $host: $!\n");

$imap->noop or die "error sending noop: $!";
$response = $imap->response;

  $imap->login('anonymous', 'kjj@pobox.com') or die "error sending login: $!";
  $response = $imap->response;
  
if (0) {
  $imap->search('/option', 'COMPARE "modtime" +octet "19951206103400"');
  $response = $imap->response;
}

$imap->logout or die "error sending logout: $!";
$response = $imap->response;
