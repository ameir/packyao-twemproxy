require 'json'

version = '0.4.1'

a = {}
a['source'] = 'https://drive.google.com/uc?id=0B6pVMMV5F5dfb1YwcThnaVZXbjg&export=download';
a['type'] = 'http';
a['license']
a['commands'] = [
    'pwd',
    'apt-get -y install build-essential autoconf',
    'tar xvfz source',
    'cd nutcracker-' + version + ' && CFLAGS="-ggdb3 -O0" ./configure --enable-debug=full && make && make install'
];
a['depends'] = [];
a['cwd'] = '';
a['env'] = [];
a['version'] = version;
a['output'] = 'deb';
a['package_files'] = [
    'nutcracker-' + version + '/src/nutcracker' => '/usr/local/sbin/nutcracker',
    'nutcracker-' + version + '/man/nutcracker.8' => '/usr/local/share/man/man8/nutcracker.8'
];
a['build_distro'] = 'ubuntu';
a['build_distro_version'] = '14.04';

File.write('packyao.json', JSON.pretty_generate(a));
