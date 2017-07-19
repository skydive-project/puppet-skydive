# class skydive::service::agent
class skydive::service::agent {

  service { 'skydive-agent':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

  file { '/etc/systemd/system/skydive-agent.service':
    ensure => file,
    mode   => '0644',
    source => 'puppet:///modules/skydive/service/systemd_agent',
    notify => [
      Exec['skydive: reload systemd'],
      Service['skydive-agent'],
    ],
  }

}
