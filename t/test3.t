#!/usr/bin/perl

use strict;
use Test;

my $testNum = '3';
my $testType = 'mbx';
my $test = "blib/script/mbx2mbox t/test$testNum.$testType";

plan(tests => 1);

print "$test\n";

system "$test 2>&1";

if ($?)
{
  print "Error executing test.\n";
  ok(0);
  exit;
}

system "mv t/test$testNum t/results/test$testNum.out";

my $diffstring = "diff -a t/results/test$testNum.out t/results/test$testNum.real";
system "$diffstring > t/results/test$testNum.diff";

if ($? == 2)
{
  print "Couldn't do diff.\n";
  ok(0);
  exit;
}

my $numdiffs = `cat t/results/test$testNum.diff | wc -l`;
$numdiffs =~ s/[\n ]//g;
$numdiffs = $numdiffs/2;

if ($numdiffs != 0)
{
  print "Failed, with $numdiffs differences.\n";
  print "  See t/results/test$testNum.out and t/results/test$testNum.diff.\n";
  ok(0);
  exit;
}

if ($numdiffs == 0)
{
  print "Succeeded.\n";
  ok(1);

  unlink "t/results/test$testNum.out";
  unlink "t/results/test$testNum.diff";
}

