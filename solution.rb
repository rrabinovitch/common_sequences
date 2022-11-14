txt_file = File.open(ARGV[0], "r")
puts "#{ARGV[0]} has been opened and read."
txt_file.close
