class TrigramCounter
  SEQUENCE_COUNT = 100

  def self.top_trigrams(text)
    split_text = normalize_text(text).split
    trigram_tracker = Hash.new(0)

    for index in (0..split_text.length - 3) do
      three_word_sequence = [split_text[index], split_text[index + 1], split_text[index + 2]].join(' ')
      trigram_tracker[three_word_sequence] += 1
    end

    sequences_ordered_by_frequency = trigram_tracker.sort_by { |sequence, frequency| -frequency }
    sequences_ordered_by_frequency.first(SEQUENCE_COUNT).to_h
  end

  def self.normalize_text(text)
    text.strip.downcase.gsub(/\R+/, ' ')
      .gsub(/[^\w\s]+|_+/i, '')
      .gsub(/-+/, ' ')
  end
end


# consider how to account for names that can be read as two words (eg, Mr. Bingley)
# consider how to account for instances of gutenberg-tm
