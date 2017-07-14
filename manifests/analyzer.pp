# class skydive::analyzer
class skydive::analyzer (

) {

  contain ::skydive
  contain ::skydive::install::analyzer
  contain ::skydive::service::analyzer

  Class['skydive']
  -> Class['skydive::install::analyzer']
  -> Class['skydive::service::analyzer']

}
