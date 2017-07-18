# class skydive::config::agent
class skydive::config::agent {

  $common_config_hash = {
    'host_id'                      => $::skydive::host_id,
    'ws_pong_timeout'              => $::skydive::ws_pong_timeout,
    'ws_bulk_maxmsg'               => $::skydive::ws_bulk_maxmsg,
    'ws_bulk_maxdelay'             => $::skydive::ws_bulk_maxdelay,
    'cache'                        => $::skydive::cache,
    'logging'                      => $::skydive::logging,
    'graph'                        => $::skydive::graph,
    'analyzers'                    => $::skydive::analyzers,
    'etcd'                         => $::skydive::etcd,
  }

  $agent_config_hash    = {
    'agent' => {
      'listen'                     => $::skydive::agent::listen,
      'X509_cert'                  => $::skydive::agent::x509_cert,
      'X509_key'                   => $::skydive::agent::x509_key,
      'topology'                   => $::skydive::agent::topology,
      'flow'                       => $::skydive::agent::flow,
      'metadata'                   => delete_undef_values($::skydive::agent::metadata),
    }
  }

  $agent_extra_config   = {
    'agent'                        => $::skydive::agent::extra_config,
  }

  $merged_config_hash = deep_merge($common_config_hash, $::skydive::extra_config, $agent_config_hash, $agent_extra_config)

  file { '/etc/skydive/skydive-agent.yml':
    ensure  => file,
    mode    => '0644',
    content => inline_template("<%= @merged_config_hash.to_yaml.gsub(/^\s{2}/, '') %>"),
    notify  => Service['skydive-agent'],
  }

}
