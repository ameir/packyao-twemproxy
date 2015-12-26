require 'json'

version = '0.4.1'

a = {}
a['name'] = 'twemproxy'
a['version'] = version
a['license'] = 'Apache'
a['commands'] = [
  <<-EOF
  apt-get update
  apt-get -y install build-essential autoconf
  wget -O source 'https://drive.google.com/uc?id=0B6pVMMV5F5dfb1YwcThnaVZXbjg&export=download'
  tar xvfz source
  cd nutcracker-#{version} && CFLAGS="-ggdb3 -O0" ./configure --enable-debug=full && make
  EOF
]
a['depends'] = []
a['cwd'] = ''
a['env'] = {}
a['outputs'] = %w(deb rpm)
a['package_files'] = {
  'nutcracker-' + version + '/scripts/nutcracker.init' => '/etc/init.d/nutcracker',
  'nutcracker-' + version + '/conf/nutcracker.yml' => '/etc/nutcracker/nutcracker.yml',
  'nutcracker-' + version + '/src/nutcracker' => '/usr/local/sbin/nutcracker',
  'nutcracker-' + version + '/man/nutcracker.8' => '/usr/local/share/man/man8/nutcracker.8'
}
a['build_distro'] = 'ubuntu'
a['build_distro_version'] = '14.04'

File.write('packyao.json', JSON.pretty_generate(a))
