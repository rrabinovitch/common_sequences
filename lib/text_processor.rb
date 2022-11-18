class TextProcessor
  def self.process_text(file_paths)
    text = read_files(file_paths)
    normalized_text = normalize_text(text)
  end

  def self.read_files(file_paths)
    text = String.new
    file_paths.each do |file_path|
      if File.extname(file_path) == ".txt"
        text << File.read(file_path)
      end
    end
    text
  end

  def self.normalize_text(text)
    text.strip.downcase
      .gsub(/\R+/, ' ')
      .gsub(/[^\w\s]+|_+/i, '')
      .gsub(/-+/, ' ')
  end
end
