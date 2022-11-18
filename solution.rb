require './lib/text_processor'
require './lib/trigram_counter'

normalized_text = TextProcessor.process_text(ARGV)
top_trigrams = TrigramCounter.top_trigrams(normalized_text)
top_trigrams.each do |sequence, frequency|
  puts "#{sequence} - #{frequency}"
end
