require 'load_jewels'

desc "Loads data for Lotus Jewels"
task :load_jewels => :environment do
  Zenzai::LoadJewels.new.execute
end
