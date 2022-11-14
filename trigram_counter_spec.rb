require 'rspec'
require './trigram_counter'

RSpec.describe TrigramCounter do
  it "returns top 3 most common three-word sequences" do
    text = File.read('./lorem_ipsum_fixture.txt')
    # do i need to close the file?

    expected = {
      "ipsum dolor sit"=>5,
      "dolor sit amet"=>4,
      "in metus vulputate"=>4
    }

    expect(TrigramCounter.top_trigrams(text)).to eq(expected)
  end
end

### future test blocks
# it catches most frequent sequences regardless of case
# it catches most frequnent sequences regardless of new lines and punctuation
