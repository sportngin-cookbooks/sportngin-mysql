default['mysql']['server']['percona']['version'] = '5.5'
default['mysql']['server']['percona']['patch_level'] = '31'
default['mysql']['server']['percona']['release'] = '30.3'
default['mysql']['server']['percona']['tag'] = '520'
default['mysql']['server']['percona']['packages'] = ['shared','client','server', 'devel']

override['mysql']['server']['service_name'] = 'mysql'
override['mysql']['server']['packages'] = []
