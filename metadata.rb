name              "up2date"
maintainer        "Sebastian Grewe"
maintainer_email  "sebastian.grewe@gmail.com"
license           "Apache 2.0"
description       "Runs a repository cache update up2dated on distribution."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1.1"
recipe            "up2date::default", "Update system package and repository caches."

%w( ubuntu debian rhel centos ).each do |sup|
  supports sup
end

%w( apt yum ).each do |dep|
  depends dep
end
