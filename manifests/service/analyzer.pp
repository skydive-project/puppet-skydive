# class skydive::service::analyzer
class skydive::service::analyzer {

  service { 'skydive-analyzer':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => File['/etc/systemd/system/skydive-analyzer.service'],
  }

  file { '/etc/systemd/system/skydive-analyzer.service':
    ensure => file,
    mode   => '0644',
    source => 'puppet:///modules/skydive/service/systemd_analyzer',
    notify => Service['skydive-analyzer'],
  }

  exec { 'skydive-analyzer: reload systemd':
    command     => 'systemctl daemon-reload',
    before      => Service['skydive-analyzer'],
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    refreshonly => true,
  }

}
