require 'csv'

module Zenzai
  class LoadJewels
    def execute
      find_files.each do |filename|
        read_file(File.new(filename))
      end
    end

    def find_files
      Dir.glob(File.join(Rails.root, "public", "*.csv")) 
    end

    def read_file(csv_file)
      csv_string = csv_file.read
      CSV.parse(csv_string, :headers => true) do |row|
        row_hash = row.to_hash
        create_jewel(row_hash)
      end
    end

    def create_jewel(row_hash)
      j = Jewel.new
      j.source = row_hash["Source"]
      j.citation = row_hash["Citation"]
      j.quote = row_hash["Quote"]
      j.comment = row_hash["Comment"]
      j.save!
    end
  end
end
