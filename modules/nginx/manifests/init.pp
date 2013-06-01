class nginx {

package {
  "nginx":
     ensure => present,
     before => File["/etc/nginx/sites-enabled/default"]
}

service {
  "nginx":
    ensure => true,
    enable => true
}

file {
  "/etc/nginx/sites-enabled/default" :
  source => "puppet:///modules/nginx/default",
  mode   => 644,
  owner  => root,
  group  => root

}

}
