require 'spec_helper'
require_relative '../lib/record_parser'

describe "RecordParser" do
  describe "::read" do
    it "defaults to the standard comma-separated csv implementation and returns an array of arrays" do
      expect(RecordParser.read("./spec/test.csv")).to eq([["Lewis","Britt","Male","4/30/1990","Blue"]])
    end

    it "takes a custom delimiter argument as a hash" do
      expect(RecordParser.read("./docs/comma.txt", delimiter: ", ")).to eq([["Abercrombie", "Neil", "Male", "Tan", "2/13/1943"], ["Bishop", "Timothy", "Male", "Yellow", "4/23/1967"], ["Kelly", "Sue", "Female", "Pink", "7/12/1959"]])
      expect(RecordParser.read("./docs/pipe.txt", delimiter: " | ")).to eq([["Smith", "Steve", "D", "M", "Red", "3-3-1985"], ["Bonk", "Radek", "S", "M", "Green", "6-3-1975"], ["Bouillon","Francis", "G", "M", "Blue", "6-3-1975"]])
      expect(RecordParser.read("./docs/space.txt", delimiter: " ")).to eq([["Kournikova", "Anna", "F", "F", "6-3-1975", "Red"], ["Hingis", "Martina", "M", "F", "4-2-1979", "Green"], ["Seles", "Monica", "H", "F", "12-2-1973", "Black"]])
    end
  end

  # describe "#" do
  #   it "" do
  #   end
  # end

  # describe "#" do
  #   it "" do
  #   end
  # end
end

# describe "RecordFactory"
