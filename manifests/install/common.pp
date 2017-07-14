# class skydive::common::install
class skydive::install::common {

  if $::skydive::manage_repo {
    case $::osfamily {
      'RedHat': {
        yumrepo { 'opstools7-sensu-common-release':
          baseurl  => 'https://cbs.centos.org/repos/opstools7-sensu-common-release/$basearch/os/',
          descr    => 'Community Build Service',
          enabled  => '1',
          gpgcheck => '0',
          notify   => Exec['yum-clean-expire-cache'],
        }

        exec { 'yum-clean-expire-cache':
          command     => '/usr/bin/yum clean expire-cache',
          refreshonly => true,
        }

        package { 'skydive':
          ensure  => installed,
          require => Yumrepo['opstools7-sensu-common-release'],
        }

      }
      default: {
        fail("Module ${module_name} is not supported on osfamily '${::osfamily}'")
      }
    }
  }

}
