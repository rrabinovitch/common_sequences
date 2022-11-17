require 'rspec'
require './lib/trigram_counter'

RSpec.describe TrigramCounter do
  it "returns top 3 most common three-word sequences in a .txt file that does not have any punctuation or newlines to be considered" do
    text = File.read('./spec/fixtures/normalized_lorem_ipsum_fixture.txt')

    expected = {
      "dolor sit amet"=>5,
      "sit amet consectetur"=>5,
      "ipsum dolor sit"=>5
    }

    expect(TrigramCounter.top_trigrams(text)).to eq(expected)
  end

  it "returns the same top 3 most common three-word sequences in a .txt file that _does_ have punctuation, newlines, and mixed capitalization" do
    text = File.read('./spec/fixtures/lorem_ipsum_fixture.txt')

    expected = {
      "dolor sit amet"=>5,
      "sit amet consectetur"=>5,
      "ipsum dolor sit"=>5
    }

    expect(TrigramCounter.top_trigrams(text)).to eq(expected)
  end
end

### future test blocks
# it catches most frequent sequences regardless of case
# it catches most frequnent sequences regardless of new lines and punctuation
# running the lorem ipsum fixture through the normalization script should return the equivalent of the normalized lorem ipsum text
