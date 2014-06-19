# encoding: utf-8

require 'spec_helper'

describe file('/var/cache/local/preseeding') do
  skip if ['rhel'].include?(node['platform_family'])
  it { should be_directory }
end
