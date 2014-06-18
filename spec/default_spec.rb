require 'chefspec'

# Test recipe inclusion
recipes = {
  "rhel" => [ "yum-epel" ],
  "debian" => [ "apt::default" ]
}

describe 'The recipe up2date::default' do
  %w( rhel debian ).each do |platform|
    describe "for platform #{platform}" do
      let(:chef_run) {
        chef_run = ChefSpec::ChefRunner.new
        chef_run.node.automatic_attrs['platform_family'] = platform
        chef_run.converge 'up2date::default'
        chef_run
      }
      recipes[platform].each do |rcp|
        it "include recipe #{rcp}" do
          chef_run.should include_recipe rcp
        end
      end
    end
  end
end
