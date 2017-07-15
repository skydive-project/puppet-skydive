# class skydive::agent
class skydive::agent (
  $listen    = $::skydive::params::agent_listen,
  $x509_cert = '',
  $x509_key  = '',
  $topology  = $::skydive::params::agent_topology,
  $flow      = $::skydive::params::agent_flow,
  $metadata  = $::skydive::params::agent_metadata,
) inherits ::skydive::params {

  contain ::skydive
  contain ::skydive::install::agent
  contain ::skydive::config::agent
  contain ::skydive::service::agent

  Class['::skydive']
  -> Class['::skydive::install::agent']
  -> Class['::skydive::config::agent']
  -> Class['::skydive::service::agent']

}