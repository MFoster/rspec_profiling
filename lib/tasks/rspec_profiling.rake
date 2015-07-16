require 'rake'

namespace :rspec_profiling do
  desc "Install the collector"
  task install: :environment do
    collector.install
  end

  desc "Uninstall the collector"
  task uninstall: :environment do
    collector.uninstall
  end

  task console: :environment do
    require 'irb'
    require 'irb/completion'
    require 'rspec_profiling'
    require 'rspec_profiling/console'
    ARGV.clear
    IRB.start
  end

  task :reset do
    collector.reset
  end

  def collector
    RspecProfiling.config.collector
  end
end
