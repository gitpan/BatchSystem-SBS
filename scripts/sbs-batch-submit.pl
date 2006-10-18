#!/usr/bin/env perl
use strict;

use BatchSystem::SBS::ScriptsCommon;
BatchSystem::SBS::ScriptsCommon::init();

use Getopt::Long;
my(@command, $chainCommands, $queue, $title);
if (!GetOptions(
		"command=s"=>\@command,
		"chain"=>\$chainCommands,
		"queue=s"=>\$queue,
		"title=s"=>\$title,
	       )
   ){
  die;
}
die "must pass a --queue=queue_name argument" unless $queue;
die "must pass at least one --command=executabe argument" unless @command;
my @ids;
foreach(@command){
  my $id;
  if ($chainCommands && @ids){
    $id=$sbs->job_submit(command=>$_, queue=>$queue, title=>$title, on_finished=>$ids[-1]);
    print STDERR "chaining [$ids[-1]](on_finished)->[$id]\n";
  }else{
    $id=$sbs->job_submit(command=>$_, queue=>$queue, title=>$title);
  }
  push @ids, $id;
}
$sbs->scheduler->scheduling_update();
print STDERR "submited job(s) [@ids]\n";
