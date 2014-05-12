class core {

  package { [
    'zip',
    'unzip',
    'curl',
    'wget',
    'tar',
    'tree',
    'make',
    'gcc',
    ] :
    ensure   => latest,
    provider => apt,
  }

}
