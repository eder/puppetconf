Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
}

package {
  "nginx":
     ensure => present
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
