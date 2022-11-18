require './lib/trigram_counter'

# switch text var from reading file directly to calling on a new TextProcessor class method that returns a string of normalized text
# can take any number of args and returns a single string of normalized text
text = File.read(ARGV[0])
top_trigrams = TrigramCounter.top_trigrams(text)
top_trigrams.each do |sequence, frequency|
  puts "#{sequence} - #{frequency}"
end
