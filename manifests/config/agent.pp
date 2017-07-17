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

  concat {'skydive-agent':
    ensure => present,
    path   => '/etc/skydive/skydive-agent.yml',
    notify => Service['skydive-agent']
  }

  concat::fragment {'skydive-agent-common':
    target  => 'skydive-agent',
    order   => '10',
    content => inline_template("<%= scope.lookupvar('skydive::configuration').to_yaml.gsub(/^\s{2}/, '') %>"),
  }

  concat::fragment {'skydive-agent-main':
    target  => 'skydive-agent',
    order   => '20',
    content => inline_template("<%= ${agent_config_hash}.to_yaml.gsub(/^\s{2}/, '') %>"),
  }

}
