require 'rspec'
require './trigram_counter'

RSpec.describe TrigramCounter do
  it "returns top 3 most common three-word sequences" do
    txt_file = './lorem_ipsum_fixture.txt'
    expected = {
      "ipsum dolor sit": 5,
      "dolor sit amet": 5,
      "sit amet consectetur": 5
    }
    expect(TrigramCounter.top_trigrams(txt_file)).to eq(expected)
  end
end
