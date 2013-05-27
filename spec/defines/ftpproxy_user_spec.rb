require 'spec_helper'

describe 'ftpproxy::user', :type => :define do
  let (:pre_condition) { '$concat_basedir = "/tmp"' }

  context 'on Debian without parameters' do
    let (:facts) { debian_facts }
    let (:title) { '_VALUE_' }

    it { should create_ftpproxy__user('_VALUE_') }
    it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_content(/[_VALUE_]/) }
  end

  context 'on Debian with parameter ensure => present' do
    let (:facts) { debian_facts }
    let (:title) { '_VALUE_' }
    let (:params) { { :ensure => 'present' } }

    it { should create_ftpproxy__user('_VALUE_') }
    it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_content(/[_VALUE_]/) }
    it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_ensure('present') }
  end

  context 'on Debian with parameter ensure => absent' do
    let (:facts) { debian_facts }
    let (:title) { '_VALUE_' }
    let (:params) { { :ensure => 'absent' } }

    it { should create_ftpproxy__user('_VALUE_') }
    it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_content(/[_VALUE_]/) }
    it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_ensure('absent') }
  end

  context 'on Debian with parameter active_max_dataport' do
    let (:facts) { debian_facts }
    let (:title) { '_VALUE_' }
    let (:params) { { :active_max_dataport => '_VALUE_' } }

    it { should create_ftpproxy__user('_VALUE_') }
    it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_content(/ActiveMaxDataPort _VALUE_/) }
  end

  context 'on Debian with parameter active_min_dataport' do
    let (:facts) { debian_facts }
    let (:title) { '_VALUE_' }
    let (:params) { { :active_min_dataport => '_VALUE_' } }

    it { should create_ftpproxy__user('_VALUE_') }
    it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_content(/ActiveMinDataPort _VALUE_/) }
  end

  context 'on Debian with parameter destination_address' do
    let (:facts) { debian_facts }
    let (:title) { '_VALUE_' }
    let (:params) { { :destination_address => '_VALUE_' } }

    it { should create_ftpproxy__user('_VALUE_') }
    it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_content(/DestinationAddress _VALUE_/) }
  end

  context 'on Debian with parameter destination_max_port' do
    let (:facts) { debian_facts }
    let (:title) { '_VALUE_' }
    let (:params) { { :destination_max_port => '_VALUE_' } }

    it { should create_ftpproxy__user('_VALUE_') }
    it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_content(/DestinationMaxPort _VALUE_/) }
  end

  context 'on Debian with parameter destination_min_port' do
    let (:facts) { debian_facts }
    let (:title) { '_VALUE_' }
    let (:params) { { :destination_min_port => '_VALUE_' } }

    it { should create_ftpproxy__user('_VALUE_') }
    it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_content(/DestinationMinPort _VALUE_/) }
  end

  context 'on Debian with parameter destination_port' do
    let (:facts) { debian_facts }
    let (:title) { '_VALUE_' }
    let (:params) { { :destination_port => '_VALUE_' } }

    it { should create_ftpproxy__user('_VALUE_') }
    it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_content(/DestinationPort _VALUE_/) }
  end

  context 'on Debian with parameter destination_transfer_mode' do
    let (:facts) { debian_facts }
    let (:title) { '_VALUE_' }
    let (:params) { { :destination_transfer_mode => '_VALUE_' } }

    it { should create_ftpproxy__user('_VALUE_') }
    it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_content(/DestinationTransferMode _VALUE_/) }
  end

  context 'on Debian with parameter passive_max_dataport' do
    let (:facts) { debian_facts }
    let (:title) { '_VALUE_' }
    let (:params) { { :passive_max_dataport => '_VALUE_' } }

    it { should create_ftpproxy__user('_VALUE_') }
    it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_content(/PassiveMaxDataPort _VALUE_/) }
  end

  context 'on Debian with parameter passive_min_dataport' do
    let (:facts) { debian_facts }
    let (:title) { '_VALUE_' }
    let (:params) { { :passive_min_dataport => '_VALUE_' } }

    it { should create_ftpproxy__user('_VALUE_') }
    it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_content(/PassiveMinDataPort _VALUE_/) }
  end

  context 'on Debian with parameter same_address' do
    let (:facts) { debian_facts }
    let (:title) { '_VALUE_' }
    let (:params) { { :same_address => '_VALUE_' } }

    it { should create_ftpproxy__user('_VALUE_') }
    it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_content(/SameAddress yes/) }
  end

  context 'on Debian with parameter time_out' do
    let (:facts) { debian_facts }
    let (:title) { '_VALUE_' }
    let (:params) { { :time_out => '_VALUE_' } }

    it { should create_ftpproxy__user('_VALUE_') }
    it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_content(/TimeOut _VALUE_/) }
  end

  context 'on Debian with parameter user_name' do
    let (:facts) { debian_facts }
    let (:title) { '_VALUE_' }
    let (:params) { { :user_name => '_VALUE_' } }

    it { should create_ftpproxy__user('_VALUE_') }
    it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_content(/[_VALUE_]/) }
  end

  # FIXME:
  #context 'on Debian with parameter valid_commands' do
  #  let (:facts) { debian_facts }
  #  let (:title) { '_VALUE_' }
  #  let (:params) { { :valid_commands => '_VALUE_' } }

  #  it { should create_ftpproxy__user('_VALUE_') }
  #  it { should contain_concat__fragment('ftpproxy_user__VALUE_').with_content(/ValidCommands _VALUE_/) }
  #end
end

