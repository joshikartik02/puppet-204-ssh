function ssh::data {
  $base_params = { 
   'ssh::ensure' => installed,
   'ssh::service_enable' => true,
   'ssh::service_ensure' => 'running',
     }
   
    case $facts['os']['family'] {
     'Debian': { 
       $os_params = {
	  'ssh::server_package_name' => 'openssh-server',
          'ssh::client_package_name' => 'openssh-clients',         
          'ssh::service_name' => 'ssh',
         }
        }
     'RedHat': {
       $os_params = {
          'ssh::server_package_name' => 'openssh-server', 
          'ssh::client_package_name' => 'openssh-clients', 
          'ssh::service_name' => 'sshd',
          }
         }
     default: {
       fail("${facts['operatingsystem']} is not supported!")
              }
        }
 $base_params + $os_params
}
