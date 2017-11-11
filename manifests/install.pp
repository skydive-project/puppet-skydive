# class skydive::common::install
class skydive::install {

  case $::skydive::installation_type {
    'package': {
      contain ::skydive::install::package
    }
    'web': {
      contain ::skydive::install::web
    }
    default: {
      fail("Well this is awkward, there's an issue with the validation of this module")
    }
  }

}
