desc "Loads delivery data for Lotus Jewels"
task :load_deliveries => :environment do
  today = Date.new(2014, 1, 4)
[85, 159, 252, 72, 366, 245, 43, 125, 293, 182, 286, 76, 17, 14, 236, 211, 161, 87, 297, 203, 68, 29, 292, 59, 346, 230, 288, 37, 249, 199, 221, 90, 51, 27, 352, 212, 325, 120, 26, 126, 356, 277, 306, 197, 254, 75, 332, 110, 173, 281, 210, 129, 98, 204, 33, 100, 362, 301, 39, 269, 295, 195, 257, 247, 302, 205].each_with_index do |num, index|
    Delivery.create(:jewel_id => num, :date => today + index.day)
  end

  Zenzai::LoadJewels.new.execute
end
