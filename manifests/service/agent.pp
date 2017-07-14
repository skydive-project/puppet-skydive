# class skydive::service::agent
class skydive::service::agent {

  service { 'skydive-agent':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => File['/etc/skydive/skydive-agent.yml'],
  }

  file { '/etc/systemd/system/skydive-agent.service.d/override.conf':
    ensure  => file,
    mode    => '0644',
    content => "[Service]\nExecStart=-\nExecStart=/usr/bin/skydive agent \$SKYDIVE_AGENT_OPTIONS --conf /etc/skydive/skydive-agent.yml",
    notify  => Service['skydive-agent'],
  }

  exec { 'skydive-agent: reload systemd':
    command     => 'systemd daemon-reload',
    before      => Service['skydive-agent'],
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    refreshonly => true,
  }

}
