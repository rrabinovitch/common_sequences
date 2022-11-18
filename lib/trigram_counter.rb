class TrigramCounter
  SEQUENCE_COUNT = 100

  def self.top_trigrams(normalized_text)
    split_text = normalized_text.split
    trigram_tracker = Hash.new(0)

    for index in (0..split_text.length - 3) do
      three_word_sequence = [split_text[index], split_text[index + 1], split_text[index + 2]].join(' ')
      trigram_tracker[three_word_sequence] += 1
    end

    sequences_ordered_by_frequency = trigram_tracker.sort_by { |sequence, frequency| -frequency }
    sequences_ordered_by_frequency.first(SEQUENCE_COUNT).to_h
  end
end
