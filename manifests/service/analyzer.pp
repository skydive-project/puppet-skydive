# class skydive::service::analyzer
class skydive::service::analyzer {

  service { 'skydive-analyzer':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

  file { '/etc/systemd/system/skydive-analyzer.service':
    ensure => file,
    mode   => '0644',
    source => 'puppet:///modules/skydive/service/systemd_analyzer',
    notify => [
      Exec['skydive: reload systemd'],
      Service['skydive-analyzer'],
    ],
  }

}
