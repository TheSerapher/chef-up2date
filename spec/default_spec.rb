# encoding: utf-8

require 'chefspec'

# Test recipe inclusion
recipes = {
  'rhel' => ['yum'],
  'debian' => ['apt::default']
}

describe 'up2date::default' do
  %w( rhel debian ).each do |platform|
    describe "for platform #{platform}" do
      before(:all) do
        @chef_run = ChefSpec::Runner.new
        @chef_run.node.set['platform_family'] = platform
        @chef_run.converge(described_recipe)
      end
      recipes[platform].each do |rcp|
        it "include recipe #{rcp}" do
          expect(@chef_run).to include_recipe rcp
        end
      end
    end
  end
end
