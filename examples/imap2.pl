#!/usr/bin/perl -wI..

use Net::IMAP;
use IO::File;

my $host = 'localhost';

my $imap = new Net::IMAP($host, Debug => 1)
  or die("can't connect to $host: $!\n");

my $imap2 = new Net::IMAP($host, Debug => 1)
  or die("can't connect to $host: $!\n");

$imap->noop or die "error sending noop: $!";
$response = $imap->response;

$imap2->noop;
$response2 = $imap2->response;

$imap->login('anonymous', 'test@') or die "error sending login: $!";
$response = $imap->response;

$imap2->login('anonymous', 'test@') or die "error sending login: $!";
$response2 = $imap2->response;

$imap->select("INBOX.greeble");
$response = $imap->response;

$imap2->select("INBOX.greeble");
$response2 = $imap2->response;

my $fh = IO::File->new('atestfile')
  or die "can't open atestfile: $!\n";
my $str; while (<$fh>) { $str .= $_; }
  
$imap->append("INBOX.greeble", $str);
$response = $imap->response;

$imap2->noop;
$response2 = $imap2->response;
  
$imap->fetch(1, 'FLAGS');
$response = $imap->response;

# $imap->_dump_internals;

$imap->close;
$response = $imap->response;

$imap->logout or die "error sending logout: $!";
$response = $imap->response;

$imap2->close;
$response2 = $imap2->response;

$imap2->logout or die "error sending logout: $!";
$response2 = $imap2->response;
