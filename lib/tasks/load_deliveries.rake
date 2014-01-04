desc "Loads delivery data for Lotus Jewels"
task :load_deliveries => :environment do
  today = Date.new(2014, 1, 4)
  [26, 100, 193, 13, 307, 186, 350, 66, 234, 123, 227, 17, 324, 321, 177, 152, 102, 28, 238, 144, 9, 336, 233, 366, 287, 171, 229, 344, 190, 140, 162, 31, 358, 334, 293, 153, 266, 61, 333, 67, 297, 218, 247, 138, 195, 16, 273, 51, 114, 222, 151, 70, 39, 145, 340, 41, 303, 242, 346, 210, 236, 136, 198, 188, 243, 146].each_with_index do |num, index|
    Delivery.create(:jewel_id => num, :date => today + index.day)
  end

  Zenzai::LoadJewels.new.execute
end
