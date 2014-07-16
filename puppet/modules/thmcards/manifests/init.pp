class thmcards {
	include git
	
	$base_path = "/vagrant"
	  
    git::repo { "thmcards":
		path => $server_path,
		source => "https://github.com/steffenh1/thmcards.git",
		owner => "vagrant",
		group => "vagrant"
    }

	
	file { "/home/vagrant/start.sh":
		owner => "vagrant",
		group => "vagrant",
		content => template("thmcards/start.sh.erb"),
		mode => "744"
    }

	class { "motd":
		template => "thmcards/motd.erb"
	}
  
}