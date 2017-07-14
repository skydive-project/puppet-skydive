# class skydive::agent
class skydive::agent (

) {

  contain ::skydive
  contain ::skydive::install::agent
  contain ::skydive::service::agent

  Class['skydive']
  -> Class['skydive::install::agent']
  -> Class['skydive::service::agent']

}
