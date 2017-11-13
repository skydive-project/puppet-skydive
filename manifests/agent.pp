# class skydive::agent
class skydive::agent (
  $service      = 'running',
  $listen       = $::skydive::params::agent_listen,
  $x509_cert    = '',
  $x509_key     = '',
  $topology     = $::skydive::params::agent_topology,
  $flow         = $::skydive::params::agent_flow,
  $metadata     = $::skydive::params::agent_metadata,
  $extra_config = {},
) inherits ::skydive {

  contain ::skydive
  contain ::skydive::config::agent
  contain ::skydive::service::agent

}
