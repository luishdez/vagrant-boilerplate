# Vagrant Startup Environment

This repository provides for a simple [vagrant](http://vagrantup.com/) 
environment, which contains the next setup:

    web node:
        - CentOS x86_64 6.3 minimal + Erb + Puppet
        - Httpd (Apache2)
        - PHP 5.4.4
        - PCRE 8.12 update

## An install ready to go.

Copy and paste the whole snippet! you need Vagrant, VirtualBox and Puppet to 
run this.

    git clone git://github.com/aggressivex/vagrant-startup-environment.git MyProject &&
    cd MyProject/Puppet &&
    librarian-puppet install &&
    cd .. &&
    vagrant up &&
    echo 'Luis says hello!' > index.html

open your browser [http://localhost.dev](http://localhost.dev)

## VM Nodes availables

The vagrant file contains a serie of nodes defined that you can uncomment to 
enable

    - web [Apache, PHP]

### The librarian

To manage the puppet modules, it uses the librarian-puppet gem
[https://github.com/rodjek/librarian-puppet](https://github.com/rodjek/librarian-puppet) 

    sudo gem install librarian-puppet # To install

### VM provision

The provider used is puppet, to manage Apache2 it uses the next module:
[https://github.com/aggressivex/puppet-httpd](https://github.com/aggressivex/puppet-httpd) 

Take a look to the README if you need to change the default vhosts in the
puppet manifests.

An extra resource to learn puppet: 
[http://puppetcookbook.com](http://puppetcookbook.com)

### Local provision

It's included a vagrant plugin that executes some manifests defined for local
purposes when the up or destroy event ocours.

You can change the path in the VagrantFile, by default it
adds a Host entry in your local system, so you can access to localhost.dev 
in your browser by default.

    config.puppet_local.puppet_destroy_path = 'Puppet/manifests/vagrant/destroy.pp'
    config.puppet_local.puppet_up_path  = 'Puppet/manifests/vagrant/up.pp'

Requires puppet in local. 

Delete the config lines from the Vagrantfile if you don't want this.

## Copyright and License

Copyright (C) 2012 Aggressivex Networks [MIT LICENSE]

Permission is hereby granted, free of charge, to any person obtaining a copy of 
this software and associated documentation files (the "Software"), to deal in 
the Software without restriction, including without limitation the rights to 
use, copy, modify,merge, publish, distribute, sublicense, and/or sell copies of 
the Software, andto permit persons to whom the Software is furnished to do so, 
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all 
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR 
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

### Authors & Contributors

*Pull requests and contributions are welcome.*

- Luis M Hdez <luis.munoz.hdez@gmail.com>