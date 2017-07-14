# class skydive::agent
class skydive::agent (

) {

  contain ::skydive
  contain ::skydive::install::agent

  Class['skydive']->Class['skydive::install::agent']

}
