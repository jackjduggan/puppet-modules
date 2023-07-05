class thresholdchecks_disk (

    # disk
    $disk_used_critical         = '95',
    $disk_used_minor            = '90',
    $disk_used_warning          = '@80:90',

)   {

    file { '/root/thresholdchecks_disk/files/thresholdchecks_disk.sh' :
        ensure  => 'file',
        owner   => 'root',
        mode    => '0744',
        content => template('/root/thresholdchecks_disk/templates/thresholdchecks_disk.erb'),
    }
}