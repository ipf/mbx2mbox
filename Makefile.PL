#!/usr/bin/perl
# use perl                                  -*- mode: Perl; -*-

use strict;
use ExtUtils::MakeMaker;

require 5.004;

# --------------------------------------------------------------------------

WriteMakefile(
  # For debugging
  #'NOECHO' => '',
  'NAME'  => 'mbx2mbox',
  # finds $VERSION
  'VERSION_FROM' => 'mbx2mbox',
  #'VERSION' => $VERSION,

  'dist'  => { COMPRESS => 'gzip -9', SUFFIX => 'gz' },
  'EXE_FILES' => ['mbx2mbox'],
  'PREREQ_PM' => {'Date::Manip' => 0},
);
