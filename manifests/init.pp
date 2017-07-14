# class skydive
class skydive (
  $manage_repo = $::skydive::params::manage_repo,
) inherits ::skydive::params {

  contain ::skydive::install::common

}
