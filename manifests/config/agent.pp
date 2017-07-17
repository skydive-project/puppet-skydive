# class skydive::config::agent
class skydive::config::agent {

  $agent_config_hash    = {
    'agent' => {
      'listen'                     => $::skydive::agent::listen,
      'X509_cert'                  => $::skydive::agent::x509_cert,
      'X509_key'                   => $::skydive::agent::x509_key,
      'topology'                   => $::skydive::agent::topology,
      'flow'                       => $::skydive::agent::flow,
      'metadata'                   => $::skydive::agent::metadata,
    }
  }

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

  $merged_config_hash = merge($common_config_hash, $agent_config_hash)

  $config = inline_template("<%= ${merged_config_hash}.to_yaml.gsub(/^\s{2}/, '') %>")

  file { '/etc/skydive/skydive-agent.yml':
    ensure  => file,
    mode    => '0644',
    content => $config,
  }

}
