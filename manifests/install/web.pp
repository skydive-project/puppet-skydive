class skydive::install::web {

  archive { '/usr/bin/skydive':
    source        => "https://github.com/skydive-project/skydive/releases/download/v${::skydive::version}/skydive",
    extract       => false,
    cleanup       => false,
    checksum      => $::skydive::web_checksum,
    checksum_type => 'sha1',
  }->
  # Needed to make the binary executable
  file { '/usr/bin/skydive':
    ensure => file,
    mode => '0550',
  }

  $skydive_packages = [
    'skydive',
    'skydive-agent',
    'skydive-analyzer',
  ]

  # Ensure Skydive packages are removed if already present
  # Handy when switching over from a previous package install
  package { $skydive_packages:
    ensure => absent,
    before => Archive['/usr/bin/skydive'],
  }

}
