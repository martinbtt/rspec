# We have to make sure the rspec lib above gets loaded rather than the gem one (in case it's installed)
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(File.expand_path("#{dir}/../../../rspec/pre_commit/lib"))
$LOAD_PATH.unshift(File.expand_path("#{dir}/../../../rspec/lib"))
require "pre_commit"
require 'spec/rake/spectask'

namespace :rspec do
  desc "runs precommit"
  task :pre_commit do
    pre_commit.rspec_pre_commit
  end

  desc "installs the Spec::Rails plugin"
  task :install_plugins do
    pre_commit.install_plugins
  end

  desc "uninstalls the Spec::Rails plugin"
  task :uninstall_plugins do
    pre_commit.uninstall_plugins
  end

  desc "configures config/database.yml for mysql"
  task :generate_mysql_config do
    pre_commit.generate_mysql_config
  end

  desc "configures config/database.yml for sqlite3"
  task :generate_sqlite3_config do
    pre_commit.generate_sqlite3_config
  end

  desc "configures config/database.yml for postgres"
  task :generate_postgres_config do
    pre_commit.generate_postgres_config
  end

  desc "deletes config/database.yml"
  task :clobber_db_config do
    pre_commit.clobber_db_config
  end

  desc "deletes sqlite databases"
  task :clobber_sqlite_data do
    pre_commit.clobber_sqlite_data
  end

  desc "Generates temporary purchase files with rspec_scaffold"
  task :generate_purchase do
    pre_commit.generate_purchase
  end

  task :migrate_up do
    pre_commit.migrate_up
  end

  desc "Destroys temporary purchase files (generated by rspec_scaffold)"
  task :destroy_purchase do
    pre_commit.destroy_purchase
  end

  task :migrate_down do
    pre_commit.migrate_down
  end

  task :rm_generated_purchase_files do
    pre_commit.rm_generated_purchase_files
  end
  
  task :generate_login_controller do
    pre_commit.generate_login_controller
  end

  task :rm_generated_login_controller_files do
    pre_commit.rm_generated_login_controller_files
  end
  
  task :cleanup do
    pre_commit.cleanup
  end

  def pre_commit
    PreCommit::RspecOnRails.new(self)
  end
end
