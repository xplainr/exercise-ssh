
## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# PRIMARY FILEBUCKET
# This configures puppet agent and puppet inspect to back up file contents when
# they run. The Puppet Enterprise console needs this to display file contents
# and differences.

# Define filebucket 'main':
filebucket { 'main':
  server => 'learn.localdomain',
  path   => false,
}

# Make filebucket 'main' the default backup location for all File resources:
File { backup => 'main' }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }

}

ssh_authorized_key {'foobar':
  key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDR0g1E8ytYsdj7QV4X3XDnUMVlk6LcyMDPvTzx9+I0YATetm/eg9hwTWU3X+83eIzaMrsMD0BpzWZOtNbTKz5/defvxa+6e6gp7mNvey7M6DTk5CHmL8KbIz7olSHkYGUc6jPP9dqm7JIxag4qOPWpZMAtOVLOW+08BiaDG2QWE2jwvVxGDmdJ2uBeMswRHdKL5kJTa69D3KLib4BuVNGZ4oriEv+AoOMggeSsi86PJ0dSDV/Ck+o3cPHT1N+8k8g99+NtisMGIi8Q7pIO153Kuv9hysCKzoWkSIdgQQ1PpiqxeqCalRx9kG9pNYk7LlEo9tUrXo2sMDa7M7/UFbf3',
  type => 'ssh-rsa',
  user => 'root'
}
