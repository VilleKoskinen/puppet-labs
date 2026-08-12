# Puppet Labs

A collection of hands-on Puppet configuration management labs completed as part of Metropolia University of Applied Sciences.

The exercises focus on infrastructure automation, configuration management, Puppet modules, and testing Puppet configurations in isolated environments.

## Labs

### GitHub Lab
Puppet configuration management exercise involving GitHub-related resources and module configuration.

**Topics:**
- Puppet manifests
- Module dependencies
- Hiera configuration
- Puppet testing with PDK and Litmus

### Splunk Lab
Automated installation and configuration of Splunk using Puppet.

**Topics:**
- Third-party Puppet modules
- Package and service management
- Configuration automation
- Testing with Puppet Litmus

### Redis Lab
Automated installation and verification of Redis using the `puppet/redis` module.

The installation was verified using the module's `redis_cli` Bolt task and a Redis `PING` command.

**Topics:**
- Puppet Forge modules
- Redis installation and service management
- Puppet Bolt tasks
- Litmus testing
- Docker-based test environments

### Kubernetes Lab
Kubernetes environment configuration using Puppet and the `puppetlabs/kubernetes` module.

**Topics:**
- Kubernetes package management
- kubeadm, kubelet and kubectl
- containerd
- Kubernetes package repositories
- Hiera configuration
- Puppet Litmus
- Docker-based infrastructure testing

## Repository Structure

```text
puppet-labs/
├── github_lab/
├── kubernetes_lab/
├── redis_lab/
└── splunk_lab/
