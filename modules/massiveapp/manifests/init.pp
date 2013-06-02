class massiveapp {
  file {
    ["/var/www/massiveapp/",
      "/var/www/massiveapp/shared/",
      "/var/www/massiveapp/shared/config/"]:
    ensure => directory,
    owner  => vagrant,
    group  => vagrant,
    mode   => 775
  }
  file {
    "/var/www/massiveapp/shared/config/database.yml":
    ensure  => present,
    owner   => vagrant,
    group   => vagrant,
    mode    => 600,
    source  => "puppet:///modules/massiveapp/database.yml"
  }
  package {
          "bundler":
            provider => gem
  }
}
