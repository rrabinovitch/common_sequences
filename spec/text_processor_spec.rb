require 'rspec'
require './lib/trigram_counter'

RSpec.describe TextProcessor do
  describe "::read_files" do
    it "can read a single txt file" do
      # word count in return value equals word count of txt file
    end

    it "can read more than one txt file" do
      # word count in return value equals the sum of the word count across all files
    end

    it "returns an error if passed a non-txt file" do

    end
  end

  describe "::normalize_text" do
    # use TrigramCounter::noramlize_text test block
  end
end
