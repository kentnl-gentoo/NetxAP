#!/usr/bin/perl -wI..

use Net::IMAP;

# my $host = 'cyrus.andrew.cmu.edu';
my $host = 'localhost';

my $imap = new Net::IMAP($host, Debug => 1, Synchronous => 1)
  or die("can't connect to $host: $!\n");

$response = $imap->noop;
print("[", $response->tag, "][", $response->status,
      "][", $response->status_text, "]\n");

$response = $imap->login('anonymous', 'kjj@');

print join('|', sort keys %{$imap->{Capabilities}}), "\n";

$response = $imap->list('', '%');

$response = $imap->status('test.mime', 'MESSAGES', 'RECENT');

$response = $imap->examine('test.mime');

$response = $imap->fetch('36', 'RFC822.HEADER');

$response = $imap->close;

$response = $imap->logout or die "error sending logout: $!";
