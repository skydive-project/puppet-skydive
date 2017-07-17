# class skydive
class skydive (
  $manage_repo      = $::skydive::params::manage_repo,
  $configuration    = $::skydive::params::configuration,
) inherits ::skydive::params {

  contain ::skydive::install::common
  contain ::skydive::config

}
