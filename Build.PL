use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Benchmark::Confirm',
    license             => 'perl',
    dist_author         => 'Dai Okabayashi <bayashi@cpan.org>',
    dist_version_from   => 'lib/Benchmark/Confirm.pm',
    configure_requires  => {
        'Module::Build' => 0.38,
    },
    requires => {
        'perl' => '5.8.1',
        'Benchmark' => 1.051,
        'Test::More' => 0.88,
    },
    add_to_cleanup      => [ 'Benchmark-Confirm-*' ],
    meta_merge     => {
      resources => {
        repository  => 'http://github.com/bayashi/Benchmark-Confirm'
      }
    },
    recursive_test_files => 1,
);

$builder->create_build_script();
