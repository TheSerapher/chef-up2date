# encoding: utf-8

require 'spec_helper'

os = backend(Serverspec::Commands::Base).check_os
if os[:family] != 'RedHat'
  describe file('/var/cache/local/preseeding') do
    it { should be_directory }
  end
end
