# encoding: UTF-8

require 'spec_helper'
require 'load_jewels'

describe Zenzai::LoadJewels do
  before do
      @csv_content = <<-EOF
Source,Citation,Quote,Comment
Lotus Sutra,Chapter 19,"When he keeps this sūtra,
He will be able to reach a rare stage.
He will be joyfully loved and respected 
By all living beings.","The Buddha sings these verses in Chapter Nineteen of the Lotus Sūtra. He describes those who put this sūtra in their lives, and dedicate their existence to liberating all beings from ignorance and delusion. When the Buddha became enlightened, he realized all beings can become enlightened. When we work for the benefit of all beings, we find the Buddha’s mind and bring harmony into our lives and the world."
Nichiren,Response to My Lady Nichinyo (Nichinyo Gozen Gohenji),"We do not see a shadow in the dark. Man does not see the flight path of a bird in the air. We do not see the path of a fish in the sea. We do not see everyone in the world reflected on the moon. However a person with “heavenly eyes” sees all these. The scene of the chapter “Appearance of a Stupa of Treasures” exists in the mind of Lady Nichinyo. Though ordinary people do not see it, Śākyamuni Buddha, the Buddha of Many Treasures and Buddhas throughout the universe recognize it. I, Nichiren, also can see it. How blessed are you!","Nichiren wrote this passage in his Response to My Lady Nichinyo (Nichinyo Gozen Gohenji). The Chapter Nichiren mentions describes the assembly of the Buddha, Many-Treasures Buddha, and innumerable Buddhas from other worlds gathered to hear the Wonderful Dharma of the Lotus Sūtra. Nichiren used a representation of this scene for the Omandala Gohonzon, his representation of the Buddha’s highest teaching. In this response, Nichiren recognizes that Lady Nichinyo sees this assembly in the reality of her everyday life. The Buddha taught that this is the most difficult of his teachings to believe and understand. Nichiren and Lady Nichinyo are examples for us that, despite this difficulty, we too can learn to see this world of delusion and ignorance as the Buddha’s pure land."
Lotus Sutra,Chapter 17,"He was strenuous and resolute in mind.  He concentrated his mind,  And refrained from indolence  For many hundreds of millions of kalpas.","The Buddha sings these verses to Maitreya Bodhisattva in Chapter Seventeen of the Lotus Sūtra. In this Chapter, the Buddha describes the benefits from practicing generosity, discipline, patience, perseverance, and in these verses, concentration. He then compares these benefits to those which come from understanding the ever-present nature of the Buddha, even for a time no longer than the time it takes to blink. The merits of the latter outshine the former as the sun in a clear sky outshines the stars. When we are assured of the Buddha’s constant presence, helping all of us to become enlightened, we find that we can accomplish far more than we thought possible."
Nichiren,"Treatise on Opening the Eyes of Buddhist Images, Wooden Statues or Portraits (Mokue Nizō Kaigen no Koto)","Mind is called the spiritual aspect while voice is the physical aspect. Therefore the spiritual aspect reveals the physical aspect. But it is also possible to perceive the mind by listening to the voice. In this case, the physical aspect (voice) reveals the spiritual aspect (mind)","Nichiren wrote this passage in his Treatise on Opening the Eyes of Buddhist Images, Wooden Statues or Portraits (Mokue Nizō Kaigen no Koto). This is one of the many instructions Nichiren gives us for how to read the Lotus Sūtra and find the wisdom of the Buddha within it. It is easy to understand how the intentions we have in our minds guide our words and actions. By cultivating the intention to benefit all beings, rather than just focusing on making ourselves happy, we mold our speech and actions to accord with that intention. Finding the mind behind the voice is more difficult. When we look for the Buddha speaking to us in all situations, especially those which are demanding, we bring ourselves closer to the Buddha’s own mind. We bring our speech and actions into harmony with the world as it is."
EOF
    @csv_file = stub("CSV File", :read => @csv_content)
    Dir.stub(:glob => ["abc"])
  end
  
  it "loads the csv file" do
    expect(described_class.new.find_files).to eq(["abc"])
  end

  describe "reading contents of the file" do
    before do
      described_class.new.read_file(@csv_file)
      @jewel = Jewel.find_by_citation("Chapter 19")
    end

    it "creates all the jewels" do
      expect(Jewel.count).to eq(4)
    end

    it "loads the source" do
      expect(@jewel.source).to eq("Lotus Sutra")
    end
    
    it "loads the citation" do
      expect(@jewel.citation).to eq("Chapter 19")
    end

    it "loads the quote" do
      expect(@jewel.quote).to start_with("When he keeps this sūtra")
    end

    it "loads the comment" do
      expect(@jewel.comment).to start_with("The Buddha sings these verses")
    end
  end

  describe "executing" do
    before do
      File.stub(:new).with("abc").and_return(@csv_file)
      described_class.new.execute
    end

    it "creates the jewels" do
      expect(Jewel.count).to eq(4)
    end
  end
end

