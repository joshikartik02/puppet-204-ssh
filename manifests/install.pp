class ssh::install(
#String $package_name = $::ssh::package_name,
 String $server_package_name = $::ssh::server_package_name,
 String $client_package_name = $::ssh::client_package_name,

String $ensure = $::ssh::ensure,
)
  {
    package { 'ssh-server-install' :
      ensure    => $ensure,
      name      => $server_package_name,
    }
    package { 'ssh-client-install' :
      ensure    => $ensure,
      name      => $client_package_name,
    }
 }  
