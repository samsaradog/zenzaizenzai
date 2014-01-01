class Factory
  def self.valid_user_attributes
    {
      :email => "abc@123.com",
      :password => "password", 
      :password_confirmation => "password",
      :is_admin => false,
      :gets_daily_dharma => false,
    }
  end

  def self.valid_jewel_attributes
    {
      :source => "abc",
      :citation => "def",
      :quote => "ghi",
      :comment => "jkl",
    }
  end

  def self.create_user(attrs = {})
    create_object(User, valid_user_attributes.merge(attrs))
  end

  def self.create_jewel(attrs = {})
    create_object(Jewel, valid_jewel_attributes.merge(attrs))
  end

  def self.create_object(klass, attrs)
    object = klass.new
    attrs.each do |attr_name, value|
      object.send("#{attr_name}=", value)
    end
    object.save!
    object
  end
end
