#!/usr/bin/env perl
use strict;

use BatchSystem::SBS::ScriptsCommon;
BatchSystem::SBS::ScriptsCommon::init();

foreach (@ARGV){
  $sbs->job_remove(id=>$_);
}
