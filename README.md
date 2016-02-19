# vagrant-sandbox
:computer: My Vagrant Sandbox - A virtual machine for developer

## What is in the box:

* htop
* git
* nodejs
* npm
* ember

## Requirements

* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)
* local home called `projects` in the home directory: `~/projects`

## Install

The install process is taking about: **30 min**

1. Download and Install `Virtual Box` - virtual machine provider
2. Download and Install `Vagrant` - virtualization tool
3. Create a projects folder (sync folder) using: `mkdir ~/projects`
4. Download this project code
5. Install the vagrant-sandbox: `vagrant up`
6. Connect to the virtual machine: `vagrant ssh`

## Vagrant Commands

```bash
vagrant <command>
```

| Command   | Description                                                                     |
| :-------- | :------------------------------------------------------------------------------ |
| up        | starts the virtual machine                                                      |
| status    | check the status for the virtual machine                                        |
| ssh       | connect to the virtual machine by ssh                                           |
| halt      | stops the virtual machine                                                       |
| provision | run the provision commands to the virtual machine, in this case the `chef-solo` |
| suspend   | save the current status of the virtual machine and hibernate it                 |
| resume    | resume the virtual machine from suspension                                      |
| destroy   | destroy the virtual machine                                                     |

## Virtual Machine configuration

### Shared Folders

the host computer and the virtual machine share a folder by `nfs` (more efficient) in both by the path: `~/projects/`

### Forward Ports

| Port | What is for                                 |
| :--- | :------------------------------------------ |
| 3000 | [rails server](http://192.168.33.10:3000)   |

## Install

After run `vagrant up` you should run:

```bash
# install dotmatrix
cd projects/hashrocket/dotmatrix; ./bin/install;

# install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
~/.rbenv/bin/rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install 2.3.0
echo "2.3.0" > ~/.ruby-version
```
