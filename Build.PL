use strict;
use warnings;
use Module::Build;

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
    add_to_cleanup      => [ 'BatchSystem-SBS-*' ],
);

$builder->create_build_script();
