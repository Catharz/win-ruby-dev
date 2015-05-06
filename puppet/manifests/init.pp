if $::kernel == windows {
  # set default package provider to chocolatey
  Package { provider => chocolatey, }
}

# install packages
package { "consolez" :
	ensure => "installed"
}

package { "vim" :
    ensure => "installed"
}

package { "sublimetext2" :
    ensure => "installed"
}

package { "ruby" :
    ensure => "installed"
}

package { "ruby2.devkit" :
    ensure => "installed"
}

package { "rubygems" :
    ensure => "installed"
}

package { "git" :
    ensure => "installed"
}

# ... other packages here...
