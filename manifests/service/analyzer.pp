# class skydive::service::analyzer
class skydive::service::analyzer {

  service { 'skydive-analyzer':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => File['/etc/skydive/skydive-analyzer.yml'],
  }

  file { '/etc/systemd/system/skydive-analyzer.service.d/override.conf':
    ensure  => file,
    mode    => '0644',
    content => "[Service]\nExecStart=-\nExecStart=/usr/bin/skydive analyzer \$SKYDIVE_AGENT_OPTIONS --conf /etc/skydive/skydive-analyzer.yml",
    notify  => Service['skydive-analyzer'],
  }

  exec { 'skydive-analyzer: reload systemd':
    command     => 'systemd daemon-reload',
    before      => Service['skydive-agent'],
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    refreshonly => true,
  }

}
