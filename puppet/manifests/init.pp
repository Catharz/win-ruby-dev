if $::kernel == windows {
  # set default package provider to chocolatey
  Package { provider => chocolatey, }
}

# install packages
package { "vim" :
    ensure => "latest"
}

package { "sublimetext2" :
    ensure => "latest"
}

package { "ruby" :
    ensure => "latest"
}

package { "ruby2.devkit" :
    ensure => "latest"
}

package { "rubygems" :
    ensure => "latest"
}

package { "git" :
    ensure => "latest"
}

# ... other packages here...
