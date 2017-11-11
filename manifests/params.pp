# Class skydive::params
class skydive::params {

  $manage_repo                         = true
  $installation_type                   = 'web'
  $version                             = '0.13.0'
  $web_checksum                        = '34bbe7910d6086ae7a6b1f03dd52b84d2255e1fe'

  $host_id                             = $::fqdn
  $ws_pong_timeout                     = 5
  $ws_bulk_maxmsg                      = 100
  $ws_bulk_maxdelay                    = 2
  $logging                             = {
    'level' => 'INFO',
    'backends' => [
      'syslog',
    ],
  }
  $graph                               = {
    'backend' => 'memory'
  }
  $cache                               = {
    'expire'  => 300,
    'cleanup' => 30,
  }
  $analyzers                           = [
    '127.0.0.1:8082',
  ]
  $etcd                                = {
    'embedded'       => true,
    'listen'         => '0.0.0.0:2379',
    'servers'        => [
      'http://127.0.0.1:2379',
    ],
    'client_timeout' => 5,
  }

  $analyzer_listen                     = '0.0.0.0:8082'
  $analyzer_flowtable_expire           = 600
  $analyzer_flowtable_update           = 60
  $analyzer_storage                    = {}
  $analyzer_topology                   = {
    'fabric' => '',
  }
  $analyzer_bandwidth_update_rate      = 5
  $analyzer_bandwidth_source           = 'netlink'
  $analyzer_bandwidth_threshold        = 'absolute'
  $analyzer_bandwidth_absolute_active  = 1
  $analyzer_bandwidth_absolute_warning = 10
  $analyzer_bandwidth_absolute_alert   = 100
  $analyzer_bandwidth_relative_active  = 0.1
  $analyzer_bandwidth_relative_warning = 0.4
  $analyzer_bandwidth_relative_alert   = 0.8

  $agent_listen                        = '0.0.0.0:8081'
  $agent_topology                      = {
    'probes'  => [],
    'netlink' => {}
  }
  $agent_flow                          = {
    'probes'  => [
      'gopacket',
      'pcapsocket',
    ]
  }
  $agent_metadata                      = {
    'info'                      => "This is compute node ${::fqdn}",
    'environment'               => $::environment,
    'bla'                       => $::bla,
    'domain'                    => $::domain,
    'is_virtual'                => $::is_virtual,
    'architecture'              => $::architecture,
    'operatingsystem'           => $::operatingsystem,
    'operatingsystemmajrelease' => $::operatingsystemmajrelease,
    'operatingsystemrelease'    => $::operatingsystemrelease,
    'osfamily'                  => $::osfamily,
    'physicalprocessorcount'    => $::physicalprocessorcount,
    'processorcount'            => $::processorcount,
    'kernel'                    => $::kernel,
    'kernelmajversion'          => $::kernelmajversion,
    'kernelrelease'             => $::kernelrelease,
    'selinux'                   => $::selinux,
    'selinux_config_mode'       => $::selinux_config_mode,
    'selinux_config_policy'     => $::selinux_config_policy,
    'selinux_current_mode'      => $::selinux_current_mode,
    'selinux_enforced'          => $::selinux_enforced,
    'selinux_policyversion'     => $::selinux_policyversion,
    'timezone'                  => $::timezone,
    'virtual'                   => $::virtual,
  }
}
