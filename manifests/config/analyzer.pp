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

  concat {'skydive-analyzer':
    ensure => present,
    path   => '/etc/skydive/skydive-analyzer.yml',
    notify => Service['skydive-analyzer']
  }

  concat::fragment {'skydive-analyzer-common':
    target  => 'skydive-analyzer',
    order   => '10',
    content => inline_template("<%= scope.lookupvar('skydive::configuration').to_yaml.gsub(/^\s{2}/, '') %>"),
  }

  concat::fragment {'skydive-analyzer-main':
    target  => 'skydive-analyzer',
    order   => '20',
    content => inline_template("<%= ${analyzer_config_hash}.to_yaml.gsub(/^\s{2}/, '') %>"),
  }

}
