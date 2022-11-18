class TextProcessor
  def self.process_text(file_paths)
    text = read_files(file_paths)
    normalized_text = normalize_text(text)
  end

  def self.read_files(file_paths)
    # TODO: refactor
    text = String.new
    # TODO: add file type check
    file_paths.each do |file_path|
      text << File.read(file_path)
    end
    text
  end

  def self.normalize_text(text)
    text.strip.downcase.gsub(/\R+/, ' ')
      .gsub(/[^\w\s]+|_+/i, '')
      .gsub(/-+/, ' ')
  end
end
