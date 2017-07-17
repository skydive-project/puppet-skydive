# class skydive::config::analyzer
class skydive::config::analyzer {

  $analyzer_config_hash = {
    'analyzer' => {
      'listen'                     => $::skydive::analyzer::listen,
      'X509_cert'                  => $::skydive::analyzer::x509_cert,
      'X509_key'                   => $::skydive::analyzer::x509_key,
      'flowtable_expire'           => $::skydive::analyzer::flowtable_expire,
      'flowtable_update'           => $::skydive::analyzer::flowtable_update,
      'storage'                    => $::skydive::analyzer::storage,
      'topology'                   => $::skydive::analyzer::topology,
      'bandwidth_update_rate'      => $::skydive::analyzer::bandwidth_update_rate,
      'bandwidth_source'           => $::skydive::analyzer::bandwidth_source,
      'bandwidth_threshold'        => $::skydive::analyzer::bandwidth_threshold,
      'bandwidth_absolute_active'  => $::skydive::analyzer::bandwidth_absolute_active,
      'bandwidth_absolute_warning' => $::skydive::analyzer::bandwidth_absolute_warning,
      'bandwidth_absolute_alert'   => $::skydive::analyzer::bandwidth_absolute_alert,
      'bandwidth_relative_active'  => $::skydive::analyzer::bandwidth_relative_active,
      'bandwidth_relative_warning' => $::skydive::analyzer::bandwidth_relative_warning,
      'bandwidth_relative_alert'   => $::skydive::analyzer::bandwidth_relative_alert,
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

  $merged_config_hash = merge($common_config_hash, $analyzer_config_hash)

  $config = inline_template("<%= ${merged_config_hash}.to_yaml.gsub(/^\s{2}/, '') %>")

  file { '/etc/skydive/skydive-analyzer.yml':
    ensure  => file,
    mode    => '0644',
    content => $config,
  }

}
