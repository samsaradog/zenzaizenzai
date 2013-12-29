require 'spec_helper'
require 'models/validate_presence_examples'

describe Jewel do
  it_behaves_like "validate presence", [:source, :citation, :quote, :comment]
end
