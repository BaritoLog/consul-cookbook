name 'prometheus'
maintainer 'Gojek Engineering'
maintainer_email 'baritolog@go-jek.com'
license 'Apache-2.0'
description 'Installs/Configures prometheus & exporter'
long_description 'Installs/Configures prometheus & exporter'
version '0.1.5'
chef_version '>= 12.14' if respond_to?(:chef_version)

issues_url 'https://github.com/BaritoLog/prometheus-cookbook/issues'
source_url 'https://github.com/BaritoLog/prometheus-cookbook'

depends "ark", "~> 3.1"
depends "logrotate", "~> 2.2.0"
depends "cron", "~> 6.2.1"
