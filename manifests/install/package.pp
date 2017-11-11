class skydive::install::package {

  if $::skydive::manage_repo {
    case $::osfamily {
      'RedHat': {
        yumrepo { 'opstools7-sensu-common-release':
          baseurl  => 'https://cbs.centos.org/repos/opstools7-sensu-common-release/$basearch/os/',
          descr    => 'Community Build Service',
          enabled  => '1',
          gpgcheck => '0',
        } ~>
        exec { 'yum-clean-expire-cache':
          command     => '/usr/bin/yum clean expire-cache',
          refreshonly => true,
        }
      }
      default: {
        fail("Module ${module_name} is not supported on osfamily '${::osfamily}'")
      }
    }
  }

  package { 'skydive':
    ensure => $::skydive::version,
  }


}
