# class skydive::config
class skydive::config {

  # $common_config_hash = {
  #   'host_id'                      => $::skydive::host_id,
  #   'ws_pong_timeout'              => $::skydive::ws_pong_timeout,
  #   'ws_bulk_maxmsg'               => $::skydive::ws_bulk_maxmsg,
  #   'ws_bulk_maxdelay'             => $::skydive::ws_bulk_maxdelay,
  #   'cache'                        => $::skydive::cache,
  #   'logging'                      => $::skydive::logging,
  #   'graph'                        => $::skydive::graph,
  # }
  #
  # $analyzer_config_hash = {
  #   'analyzer' => {
  #     'listen'                     => $::skydive::analyzer::listen,
  #     'X509_cert'                  => $::skydive::analyzer::x509_cert,
  #     'X509_key'                   => $::skydive::analyzer::x509_key,
  #     'flowtable_expire'           => $::skydive::analyzer::flowtable_expire,
  #     'flowtable_update'           => $::skydive::analyzer::flowtable_update,
  #     'storage'                    => $::skydive::analyzer::storage,
  #     'topology'                   => $::skydive::analyzer::topology,
  #     'bandwidth_update_rate'      => $::skydive::analyzer::bandwidth_update_rate,
  #     'bandwidth_source'           => $::skydive::analyzer::bandwidth_source,
  #     'bandwidth_threshold'        => $::skydive::analyzer::bandwidth_threshold,
  #     'bandwidth_absolute_active'  => $::skydive::analyzer::bandwidth_absolute_active,
  #     'bandwidth_absolute_warning' => $::skydive::analyzer::bandwidth_absolute_warning,
  #     'bandwidth_absolute_alert'   => $::skydive::analyzer::bandwidth_absolute_alert,
  #     'bandwidth_relative_active'  => $::skydive::analyzer::bandwidth_relative_active,
  #     'bandwidth_relative_warning' => $::skydive::analyzer::bandwidth_relative_warning,
  #     'bandwidth_relative_alert'   => $::skydive::analyzer::bandwidth_relative_alert,
  #   }
  # }
  #
  # $agent_config_hash    = {
  #   'agent' => {
  #     'listen'                     => $::skydive::agent::listen,
  #     'X509_cert'                  => $::skydive::agent::x509_cert,
  #     'X509_key'                   => $::skydive::agent::x509_key,
  #     'topology'                   => $::skydive::agent::topology,
  #     'flow'                       => $::skydive::agent::flow,
  #     'metadata'                   => $::skydive::agent::metadata,
  #   }
  # }
  #
  # $merged_config_hash = merge($common_config_hash, $analyzer_config_hash, $agent_config_hash)
  #
  # $config = inline_template("<%= ${merged_config_hash}.to_yaml.gsub(/^\s{2}/, '') %>")

  file { '/etc/skydive':
    ensure => directory,
    mode   => '0755',
  }

  # file { '/etc/skydive/skydive.yml':
  #   ensure  => file,
  #   mode    => '0644',
  #   content => $config,
  # }

}
