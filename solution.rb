require './lib/trigram_counter'

text = File.read(ARGV[0])
top_trigrams = TrigramCounter.top_trigrams(text)
top_trigrams.each do |sequence, frequency|
  puts "#{sequence} - #{frequency}"
end
