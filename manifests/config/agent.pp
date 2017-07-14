# class skydive::config::agent
class skydive::config::agent inherits ::skydive::config::common {

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

  $merged_config_hash = merge($::skydive::config::common::common_config_hash, $agent_config_hash)

  $config = inline_template("<%= ${merged_config_hash}.to_yaml.gsub(/^\s{2}/, '') %>")

  file { '/etc/skydive/skydive-agent.yml':
    ensure  => file,
    mode    => '0644',
    content => $config,
  }

}
