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

  $merged_config_hash = merge($::skydive::configuration, $agent_config_hash)

  file { '/etc/skydive/skydive-agent.yml':
    ensure  => file,
    mode    => '0644',
    content => inline_template("<%= @merged_config_hash.to_yaml.gsub(/^\s{2}/, '') %>"),
    notify  => Service['skydive-agent'],
  }

}
