class apachehost (

    $server_ip = '123.45.67.89',
    $uninstall = false,
) {

    # Installation
    if $uninstall != true {

        # Install apache httpd
        package { 'httpd':
        ensure => 'installed',
        }

        # Ensure it's running
        service { 'httpd':
        ensure => 'running',
        }

        # Ensure index.html exists, don't really care about the content
        file { '/var/www/html/index.html':
        ensure => 'present',
        content => template('/root/apachehost/templates/apachehost.erb'),
        }
    }

    # Uninstallation
    else {

        # Stop the service
        service { 'httpd':
        ensure => 'stopped',
        }

#        # Uninstall apache httpd
#        package { 'httpd':
#        ensure => 'absent',
#        }

        # Purge apache httpd
        package { 'httpd':
        ensure => 'purged',
        }

        # Ensure index.html is absent
        file { '/var/www/html/index.html':
        ensure => 'absent',
        }
    }

}
