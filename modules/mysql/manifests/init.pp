class mysql {
 package {
  "mysql-server":
    ensure => installed,
    before => File["/etc/mysql/my.cnf"]
 }
 file {
  "/etc/mysql/my.cnf":
    owner  => root,
    group  => root,
    mode   => 644,
    source => "puppet:///modules/mysql/my.cnf"
 }
 service {
  "mysql":
    ensure    => running,
    subscribe => File["/etc/mysql/my.cnf"]
 }
 exec {
    "mysql_password":
      unless  => "mysqladmin -uroot -p status",
      command => "mysqladmin -uroot ",
      require => Service[mysql];
    "massiveapp_db":
      unless  => "mysql -uroot -proot massiveapp_production",
      command => "mysql -uroot -proot -e 'create database massiveapp_production'",
      require => Exec["mysql_password"]
  }
}
