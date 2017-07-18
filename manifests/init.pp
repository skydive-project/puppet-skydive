# class skydive
class skydive (
  $manage_repo      = $::skydive::params::manage_repo,
  $host_id          = $::skydive::params::host_id,
  $logging          = $::skydive::params::logging,
  $graph            = $::skydive::params::graph,
  $cache            = $::skydive::params::cache,
  $analyzers        = $::skydive::params::analyzers,
  $etcd             = $::skydive::params::etcd,
  $ws_pong_timeout  = $::skydive::params::ws_pong_timeout,
  $ws_bulk_maxmsg   = $::skydive::params::ws_bulk_maxmsg,
  $ws_bulk_maxdelay = $::skydive::params::ws_bulk_maxdelay,
  $extra_config     = {},
) inherits ::skydive::params {

  contain ::skydive::install::common
  contain ::skydive::config

}
