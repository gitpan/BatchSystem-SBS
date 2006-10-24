use strict;
use warnings;
use Module::Build;


my @scripts;
open (fd, "<MANIFEST") or die "cannot open MANIFEST: $!";
while(<fd>){
  chomp;
  push @scripts, $_ if /^(scripts)\//;
}

my %cgi_scripts;
open (fd, "<MANIFEST") or die "cannot open MANIFEST: $!";
while(<fd>){
  chomp;
  $cgi_scripts{$_}=$_ if /^(cgi)\//;
}


my $builder = Module::Build->new(
    module_name         => 'BatchSystem::SBS',
    license             => 'lgpl',
    create_makefile_pl => 'traditional',
    create_readme => 'README',
    dist_author         => 'Alexandre Masselot <alexandre.masselot@genebio.com>',
    dist_version_from   => 'lib/BatchSystem/SBS.pm',
    requires => {
		 'Cwd'=>0,
		 'Data::Serializer'=>0,
		 'IO::All' => 0,
		 'LockFile::Simple' =>0,
		 'Object::InsideOut' => 0,
		 'Test::More' => 0,
		 'File::Basename'=>0,
		 'File::Copy'=>0,
		 'File::Flock'=>0,
		 'File::Path'=>0,
		 'File::Spec'=>0,
		 'File::Temp'=>0,
		 'Getopt::Long'=>0,
		 'IO::All'=>0,
		 'List::Util'=>0,
		 'LockFile::Simple'=>0,
		 'Util::Properties'=>0,
		 'XML::Twig'=>'3.14',
    },
    script_files=>\@scripts,
    cgi_files=>\%cgi_scripts,
    install_path => { cgi =>"blib/cgi/" },
    add_to_cleanup      => [ 'BatchSystem-SBS-*' ],
);

$builder->add_build_element('cgi') || die "cannot add build element [cgi]";
$builder->prereq_failures() && $builder->prereq_failures()->{requires}  && die "conflicts (missing requirem\ents?)";
$builder->create_build_script;

