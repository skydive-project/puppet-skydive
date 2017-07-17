# class skydive::service::agent
class skydive::service::agent {

  service { 'skydive-agent':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => Concat['/etc/skydive/skydive-agent.yml'],
    require    => File['/etc/systemd/system/skydive-agent.service'],
  }

  file { '/etc/systemd/system/skydive-agent.service':
    ensure => file,
    mode   => '0644',
    source => 'puppet:///modules/skydive/service/systemd_agent',
    notify => Service['skydive-agent'],
  }

  exec { 'skydive-agent: reload systemd':
    command     => 'systemctl daemon-reload',
    before      => Service['skydive-agent'],
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    refreshonly => true,
  }

}
