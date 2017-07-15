# class skydive::config::common
class skydive::config::common {
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
}
