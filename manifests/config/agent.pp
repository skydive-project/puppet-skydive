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

  concat::fragment {'agent':
    target  => '/etc/skydive/skydive-agent.yml',
    order   => '20',
    content => inline_template("<%= ${agent_config_hash}.to_yaml.gsub(/^\s{2}/, '') %>"),
  }

}
