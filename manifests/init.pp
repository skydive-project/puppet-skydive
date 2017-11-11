# class skydive
class skydive (
  $host_id           = $::skydive::params::host_id,
  $logging           = $::skydive::params::logging,
  $graph             = $::skydive::params::graph,
  $cache             = $::skydive::params::cache,
  $analyzers         = $::skydive::params::analyzers,
  $etcd              = $::skydive::params::etcd,
  $version           = $::skydive::params::version,
  $web_checksum      = $::skydive::params::web_checksum,
  $manage_repo       = $::skydive::params::manage_repo,
  $installation_type = $::skydive::params::installation_type,
  $ws_pong_timeout   = $::skydive::params::ws_pong_timeout,
  $ws_bulk_maxmsg    = $::skydive::params::ws_bulk_maxmsg,
  $ws_bulk_maxdelay  = $::skydive::params::ws_bulk_maxdelay,
  $extra_config      = {},
) inherits ::skydive::params {

  # Some validations
  ## Validate allowed installation_type
  if ! ($installation_type in [ 'web', 'package' ]) {
    fail("Installation type: ${installation_type} invalid. Allowed installation types are: web, package")
  }
  # When doing a web install, the version must be specified, 'present' is not valid
  if $installation_type == 'web' and $version in ['present', 'latest'] {
    fail("Installation type ${installation_type} requires and actual version string equivalent to that on github. Example: 0.13.0")
  }

  contain ::skydive::install
  contain ::skydive::config

}
