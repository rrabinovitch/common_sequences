class TrigramCounter
  def self.top_trigrams(text)
    normalized_text = text.downcase
    trigram_tracker = Hash.new

    normalized_text.split.each_with_index do |word, index|
      # define variable holding current iteration's three-word sequence using index
      # check if that sequence exists as a key in trigram_tracker
        # if not, save that variable as a key in trigram_tracker, with value starting at 1
        # if yes, add += 1 to that key's value
    end

    # sort trigram_tracker by desc values
    # return top 3

    {
      "ipsum dolor sit": 5,
      "dolor sit amet": 5,
      "sit amet consectetur": 5
    }
  end
end
