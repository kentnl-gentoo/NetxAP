#!/usr/bin/perl

use ExtUtils::MakeMaker;

WriteMakefile(
	      NAME     => 'Net',
	      VERSION  => '0.01',
	      DISTNAME => 'NetxAP',
	      PREREQ_PM => { },
	      'dist'   => { COMPRESS => 'gzip', SUFFIX => '.gz' },
);
