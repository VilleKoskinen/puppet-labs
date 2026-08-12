require 'spec_helper_acceptance'

describe 'github_file class' do
  repository_path = '/tmp/puppet-github-lab'
  managed_file = "#{repository_path}/hello.txt"

  manifest = <<~PUPPET
    class { 'github_file':
      repository_url  => 'https://github.com/VilleKoskinen/puppet-github-lab.git',
      repository_path => '#{repository_path}',
      file_name       => 'hello.txt',
      file_content    => "Hello from Puppet!\\n",
    }
  PUPPET

  it 'applies the manifest successfully' do
    apply_manifest(manifest, catch_failures: true)
  end

  it 'is idempotent' do
    apply_manifest(manifest, catch_changes: true)
  end

  describe file(managed_file) do
    it { is_expected.to exist }
    it { is_expected.to be_file }
    its(:content) { is_expected.to eq("Hello from Puppet!\n") }
  end
end
