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
    before => Service['skydive-agent'],
    source => 'puppet:///modules/skydive/service/systemd_agent',
    notify => Service['skydive-agent'],
  }

  exec { 'skydive-agent: reload systemd':
    command     => 'systemctl daemon-reload',
    before      => Service['skydive-agent'],
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    refreshonly => true,
    require     => File['/etc/systemd/system/skydive-agent.service'],
  }

}
