#!/usr/bin/env perl
use strict;

use BatchSystem::SBS::ScriptsCommon;
BatchSystem::SBS::ScriptsCommon::init();

use Getopt::Long;
my(@command, $queue);
if (!GetOptions(
		"command=s"=>\@command,
		"queue=s"=>\$queue,
	       )
   ){
  die;
}
die "must pass a --queue=queue_name argument" unless $queue;
die "must pass at least one --command=executabe argument" unless @command;
my @id;
foreach(@command){
  push @id, $sbs->job_submit(command=>$_, queue=>$queue);
}
$sbs->scheduler->scheduling_update();
print STDERR "submited job(s) [@id]\n";
