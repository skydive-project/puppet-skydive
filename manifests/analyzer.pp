# class skydive::analyzer
class skydive::analyzer (

) {

  contain ::skydive
  contain ::skydive::install::analyzer

  Class['skydive']->Class['skydive::install::analyzer']

}
