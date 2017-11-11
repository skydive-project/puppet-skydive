# class skydive::service::analyzer
class skydive::service::analyzer {

  case $::skydive::installation_type {
    'web': {
      service { 'skydive-analyzer':
        ensure     => $::skydive::analyzer::service,
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
      service { 'skydive-analyzer':
        ensure     => $::skydive::analyzer::service,
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

        exec { 'skydive-analyzer: reload systemd':
          command     => 'systemctl daemon-reload',
          path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
          refreshonly => true,
        }

        file { '/etc/systemd/system/skydive-analyzer.service':
          ensure => file,
          mode   => '0644',
          source => 'puppet:///modules/skydive/service/systemd_analyzer',
          notify => [
            Exec['skydive-analyzer: reload systemd'],
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
