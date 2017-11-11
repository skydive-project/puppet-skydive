# class skydive::service::agent
class skydive::service::agent {

  case $::skydive::installation_type {
    'web': {
      service { 'skydive-agent':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        subscribe  => [
         Archive['/usr/bin/skydive'],
         File['/usr/bin/skydive'],
       ],
      }
    }
    default: {
      service { 'skydive-agent':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        subscribe  => Package['skydive'],
      }
    }
  }

  case $::osfamily {
    'RedHat': {
      if versioncmp($::operatingsystemmajrelease, '7') >= 0 {

        exec { 'skydive-agent: reload systemd':
          command     => 'systemctl daemon-reload',
          path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
          refreshonly => true,
        }

        file { '/etc/systemd/system/skydive-agent.service':
          ensure => file,
          mode   => '0644',
          source => 'puppet:///modules/skydive/service/systemd_agent',
          notify => [
            Exec['skydive-agent: reload systemd'],
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
