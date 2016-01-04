name             'bosh-jumpbox'
maintainer       'Andrei Krasnitski'
maintainer_email 'xaaabk@gmail.com'
license          'Apache 2.0'
description      'Configure BOSH Jumpbox'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'ark'
depends 'apt'
depends 'golang'
depends 'rvm_sl'

supports 'ubuntu', '>= 14.04'
