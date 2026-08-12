# @summary
#   Clones a Git repository and creates a managed text file inside it.
#
# @param repository_url
#   HTTPS URL of the Git repository to clone.
#
# @param repository_path
#   Absolute path where the repository is cloned.
#
# @param file_name
#   Name of the text file created inside the repository.
#
# @param file_content
#   Content written to the managed text file.
#
class github_file (
  String $repository_url = 'https://github.com/VilleKoskinen/puppet-github-lab.git',
  String $repository_path = '/tmp/puppet-github-lab',
  String $file_name = 'hello.txt',
  String $file_content = "Hello from Puppet!\n",
) {
  package { 'git':
    ensure => installed,
  }

  vcsrepo { $repository_path:
    ensure   => present,
    provider => git,
    source   => $repository_url,
    require  => Package['git'],
  }

  file { "${repository_path}/${file_name}":
    ensure  => file,
    content => $file_content,
    require => Vcsrepo[$repository_path],
  }
}
