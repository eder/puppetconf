class unicorn {
  exec {
    "/usr/bin/gem install unicorn":
      user    => root,
      group   => root,
      alias   => "install_unicorn"
  }
}
