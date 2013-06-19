require 'spec_helper'

describe 'ftpproxy', :type => :class do
  let (:pre_condition) { '$concat_basedir = "/tmp"' }
  let (:params) { { :config_dir => '_CONFIG_DIR_' } }

  context 'without parameters' do
    let (:facts) { debian_facts }

    it { should create_class('ftpproxy') }
    it { should include_class('ftpproxy::install') }
    it { should include_class('ftpproxy::config') }
    it { should include_class('ftpproxy::service') }

    it { should contain_package('ftp-proxy').with_ensure('present') }
    it { should contain_file('_CONFIG_DIR_/ftp-proxy.conf').with_ensure('present') }

    it { should contain_service('ftp-proxy').with(
        'ensure'     => 'running',
        'enable'     => 'true',
        'hasrestart' => 'true'
      )
    }
  end

  context 'with parameter: chroot_dir' do
    let (:facts) { debian_facts }
    let (:params) { { :chroot_dir => '_VALUE_' } }

    it { should_not contain_file('_VALUE_').with_ensure('directory') }
  end

  context 'with parameter: chroot_enable' do
    let (:facts) { debian_facts }
    let (:params) { { :chroot_enable => true, :chroot_dir => '_VALUE_' } }

    it { should contain_file('_VALUE_').with_ensure('directory') }
  end

  context 'with parameter: chroot_enable => true and chroot_dir => undef' do
    let (:facts) { debian_facts }
    let (:params) { { :chroot_enable => true, :chroot_dir => '' } }

    it do
      expect { should create_class('ftpproxy')  }.to raise_error(Puppet::Error)
    end
  end

  context 'with parameter: config_dir' do
    let (:facts) { debian_facts }
    let (:params) { { :config_dir => '_VALUE_' } }

    it { should contain_file('_VALUE_').with_ensure('directory') }
  end

  context 'with parameter: config_dir_mode' do
    let (:facts) { debian_facts }
    let (:params) { { :config_dir_mode => '_VALUE_' } }

    it { should contain_file('/etc/proxy-suite').with_mode('_VALUE_') }
  end

  context 'with parameter: config_file_mode' do
    let (:facts) { debian_facts }
    let (:params) { { :config_file_mode => '_VALUE_' } }

    it { should contain_file('/etc/proxy-suite/ftp-proxy.conf').with_mode('_VALUE_') }
  end

  context 'with parameter: config_group' do
    let (:facts) { debian_facts }
    let (:params) { { :config_group => '_VALUE_' } }

    it { should contain_file('/etc/proxy-suite/ftp-proxy.conf').with_group('_VALUE_') }
  end

  context 'with parameter: config_user' do
    let (:facts) { debian_facts }
    let (:params) { { :config_user => '_VALUE_' } }

    it { should contain_file('/etc/proxy-suite/ftp-proxy.conf').with_owner('_VALUE_') }
  end

  #context 'with parameter: daemon_group' do
  #  let (:facts) { debian_facts }
  #  let (:params) { { :daemon_group => '_VALUE_' } }
  #
  #  it { should contain_concat__fragment('ftpproxy.conf_header').with_content(/Group _VALUE_/) }
  #end

  #context 'with parameter: daemon_user' do
  #  let (:facts) { debian_facts }
  #  let (:params) { { :daemon_user => '_VALUE_' } }
  #
  #  it { should contain_concat__fragment('ftpproxy.conf_header').with_content(/User _VALUE_$/) }
  #end

  context 'with parameter destination_address' do
    let (:facts) { debian_facts }
    let (:params) { { :destination_address => '_VALUE_' } }

    it { should contain_concat__fragment('ftpproxy.conf_header').with_content(/DestinationAddress _VALUE_/) }
  end

  context 'with parameter destination_port' do
    let (:facts) { debian_facts }
    let (:params) { { :destination_port => '_VALUE_' } }

    it { should contain_concat__fragment('ftpproxy.conf_header').with_content(/DestinationPort _VALUE_/) }
  end

  context 'with parameter destination_transfermode' do
    let (:facts) { debian_facts }
    let (:params) { { :destination_transfermode => '_VALUE_' } }

    it { should contain_concat__fragment('ftpproxy.conf_header').with_content(/DestinationTransferMode _VALUE_/) }
  end

  context 'with parameter fork_limit' do
    let (:facts) { debian_facts }
    let (:params) { { :fork_limit => '_VALUE_' } }

    it { should contain_concat__fragment('ftpproxy.conf_header').with_content(/ForkLimit _VALUE_/) }
  end

  context 'with parameter listen_address' do
    let (:facts) { debian_facts }
    let (:params) { { :listen_address => '_VALUE_' } }

    it { should contain_concat__fragment('ftpproxy.conf_header').with_content(/Listen _VALUE_/) }
  end

  context 'with parameter listen_port' do
    let (:facts) { debian_facts }
    let (:params) { { :listen_port => '_VALUE_' } }

    it { should contain_concat__fragment('ftpproxy.conf_header').with_content(/Port _VALUE_/) }
  end

  context 'with parameter log_destination' do
    let (:facts) { debian_facts }
    let (:params) { { :log_destination => '_VALUE_' } }

    it { should contain_concat__fragment('ftpproxy.conf_header').with_content(/LogDestination _VALUE_/) }
  end

  context 'with parameter: log_dir' do
    let (:facts) { debian_facts }
    let (:params) { { :log_dir => '_VALUE_' } }

    it { should contain_file('_VALUE_').with_ensure('directory') }
  end

  #context 'with parameter max_clients' do
  #  let (:facts) { debian_facts }
  #  let (:params) { { :max_clients => '_VALUE_' } }
  #
  #  it { should contain_concat__fragment('ftpproxy.conf_header').with_content(/MaxClients _VALUE_/) }
  #end

  context 'with parameter: pid_file' do
    let (:facts) { debian_facts }
    let (:params) { { :pid_file => '_VALUE_' } }

    it { should create_class('ftpproxy') }
  end

  context 'with parameter: pkg_deps' do
    let (:facts) { debian_facts }
    let (:params) { { :pkg_deps => '_VALUE_' } }

    it { should contain_package('_VALUE_').with_ensure('present') }
  end

  context 'with parameter: pkg_ensure' do
    let (:facts) { debian_facts }
    let (:params) { { :pkg_ensure => '_VALUE_' } }

    it { should contain_package('ftp-proxy').with_ensure('_VALUE_') }
  end

  context 'with parameter: pkg_ensure and pkg_deps' do
    let (:facts) { debian_facts }
    let (:params) { { :pkg_ensure => '_VALUE_', :pkg_deps => '_VALUE_' } }

    it { should contain_package('_VALUE_').with_ensure('_VALUE_') }
  end

  context 'with parameter: pkg_list' do
    let (:facts) { debian_facts }
    let (:params) { { :pkg_list => '_VALUE_' } }

    it { should contain_package('_VALUE_') }
  end

  context 'with parameter same_address' do
    let (:facts) { debian_facts }
    let (:params) { { :same_address => true } }

    it { should contain_concat__fragment('ftpproxy.conf_header').with_content(/SameAddress yes/) }
  end

  context 'with parameter same_address' do
    let (:facts) { debian_facts }
    let (:params) { { :same_address => false } }

    it { should contain_concat__fragment('ftpproxy.conf_header').with_content(/SameAddress no/) }
  end

  #context 'with parameter server_type' do
  #  let (:facts) { debian_facts }
  #  let (:params) { { :server_type => '_VALUE_' } }
  #
  #  it { should contain_concat__fragment('ftpproxy.conf_header').with_content(/ServerType.*_VALUE_/) }
  #end

  context 'with parameter: service_enable' do
    let (:facts) { debian_facts }
    let (:params) { { :service_enable => true } }

    it { should contain_service('ftp-proxy').with_enable('true') }
  end

  context 'with parameter: service_ensure' do
    let (:facts) { debian_facts }
    let (:params) { { :service_ensure => '_VALUE_' } }

    it { should contain_service('ftp-proxy').with_ensure('_VALUE_') }
  end

  context 'with parameter: service_hasrestart' do
    let (:facts) { debian_facts }
    let (:params) { { :service_hasrestart => true } }

    it { should contain_service('ftp-proxy').with_hasrestart('true') }
  end

  context 'with parameter: service_hasstatus' do
    let (:facts) { debian_facts }
    let (:params) { { :service_hasstatus => true } }

    it { should contain_service('ftp-proxy').with_hasstatus('true') }
  end

  context 'with parameter: service_name' do
    let (:facts) { debian_facts }
    let (:params) { { :service_name => '_VALUE_' } }

    it { should contain_service('_VALUE_') }
  end

  context 'with parameter service_enable => true and service_ensure => disabled' do
    let (:facts) { debian_facts }
    let (:params) { { :service_enable => true, :service_ensure => 'disabled' } }
    it { should contain_augeas('ftpproxy RUN_DAEMON').with_changes(/set RUN_DAEMON no/) }
  end

  context 'with parameter service_enable => true and service_ensure => running' do
    let (:facts) { debian_facts }
    let (:params) { { :service_enable => true, :service_ensure => 'running' } }
    it { should contain_augeas('ftpproxy RUN_DAEMON').with_changes(/set RUN_DAEMON yes/) }
  end

  #context 'with parameter time_out' do
  #  let (:facts) { debian_facts }
  #  let (:params) { { :time_out => '_VALUE_' } }
  #
  #  it { should contain_concat__fragment('ftpproxy.conf_header').with_content(/TimeOut.*_VALUE_/) }
  #end

  #context 'with parameter translated_address' do
  #  let (:facts) { debian_facts }
  #  let (:params) { { :translated_address => '_VALUE_' } }
  #
  #  it { should contain_concat__fragment('ftpproxy.conf_header').with_content(/TranslatedAddress.*_VALUE_/) }
  #end

  context 'with parameter welcome_string' do
    let (:facts) { debian_facts }
    let (:params) { { :welcome_string => '_VALUE_' } }

    it { should contain_concat__fragment('ftpproxy.conf_header').with_content(/WelcomeString.*_VALUE_/) }
  end
end

