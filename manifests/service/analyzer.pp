# class skydive::service::analyzer
class skydive::service::analyzer {

  service { 'skydive-analyzer':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

  case $::osfamily {
    'RedHat': {
      if versioncmp($::operatingsystemmajrelease, '7') >= 0 {
        file { '/etc/systemd/system/skydive-analyzer.service':
          ensure => file,
          mode   => '0644',
          source => 'puppet:///modules/skydive/service/systemd_analyzer',
          notify => [
            Exec['skydive: reload systemd'],
            Service['skydive-analyzer'],
          ],
        }
      } else {
        file { '/etc/init.d/skydive-analyzer.conf':
          ensure => file,
          mode   => '0644',
          source => 'puppet:///modules/skydive/service/upstart_analyzer',
          notify => [
            Service['skydive-analyzer'],
          ],
        }
      }
    }
    default: {
      fail("Module ${module_name} is not supported on osfamily '${::osfamily}'")
    }
  }

}
