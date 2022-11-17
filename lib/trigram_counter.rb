### NEXT
# refactor out helper methods for text normalization
# update specs to test helper methods
# update specs to test for top 100 instead of top 3

class TrigramCounter
  def self.top_trigrams(text)
    split_text = normalize_text(text).split

    trigram_tracker = Hash.new(0)

    # loop through split_text array until the third to last element
    for index in (0..split_text.length - 3) do
      # define variable holding current iteration's three-word sequence using index
      three_word_sequence = [split_text[index], split_text[index + 1], split_text[index + 2]].join(' ')
      # check if that sequence exists as a key in trigram_tracker
        # if not, save that variable as a key in trigram_tracker, with value starting at 1
        # if yes, add += 1 to that key's value
      trigram_tracker[three_word_sequence] += 1 # not sure if ||= operator might be a better fit here
    end
    # sort trigram_tracker by desc values
    sequences_ordered_by_frequency = trigram_tracker.sort_by { |sequence, frequency| -frequency } # is there a more efficient way of doing this? without needing to transform from hash to array and then back to hash?
    # return top 3
    sequences_ordered_by_frequency.first(3).to_h
  end

  def self.normalize_text(text)
    # removes leading and trailing whitespace and downcases entire string of text
    # substitutes any instances of one or more carriage return characters for a space
    # removes any instances of one or more punctuation characters and underscores
    # substitutes any instances of one or more dashes for a space
    text.strip.downcase.gsub(/\R+/, ' ').gsub(/[^\w\s]+|_+/i, '').gsub(/-+/, ' ')

    # does not take into account non-word characters like % if they are sandwhiched in between spaces
  end
end



# split out helper methods for normalizing text
# consider how to account for names that can be read as two words (eg, Mr. Bingley)
# consider how to account for instances of gutenerge-tm
