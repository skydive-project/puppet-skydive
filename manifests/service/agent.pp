# class skydive::service::agent
class skydive::service::agent {

  service { 'skydive-agent':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

  case $::osfamily {
    'RedHat': {
      if versioncmp($::operatingsystemmajrelease, '7') >= 0 {
        file { '/etc/systemd/system/skydive-agent.service':
          ensure => file,
          mode   => '0644',
          source => 'puppet:///modules/skydive/service/systemd_agent',
          notify => [
            Exec['skydive: reload systemd'],
            Service['skydive-agent'],
          ],
        }
      } else {
        file { '/etc/init.d/skydive-agent.conf':
          ensure => file,
          mode   => '0644',
          source => 'puppet:///modules/skydive/service/upstart_agent',
          notify => [
            Service['skydive-agent'],
          ],
        }
      }
    }
    default: {
      fail("Module ${module_name} is not supported on osfamily '${::osfamily}'")
    }
  }

}
