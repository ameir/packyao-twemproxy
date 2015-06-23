require 'json'

a = {}
a['source'] = 'https://drive.google.com/uc?export=download&id=0B-jblWXS1ZxsNmJIUzBscWVKU2M';
a['type'] = 'http';
a['commands'] = [
    'pwd',
    'apt-get -y install build-essential autoconf',
    'tar xvfz source',
    'cd nutcracker-0.4.0 && CFLAGS="-ggdb3 -O0" ./configure --enable-debug=full && make && make install'
];
a['depends'] = [];
a['cwd'] = '';
a['env'] = [];
a['version'] = '';
a['output'] = 'deb';
a['package_files'] = [
    'nutcracker-0.4.0/src/nutcracker' => '/usr/local/sbin/nutcracker',
    'nutcracker-0.4.0/man/nutcracker.8' => '/usr/local/share/man/man8/nutcracker.8'
];
a['build_distro'] = 'ubuntu';
a['build_distro_version'] = '14.04';

File.write('packyao.json', JSON.pretty_generate(a));
