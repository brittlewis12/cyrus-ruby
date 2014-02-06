require 'spec_helper'
require_relative '../lib/record_parser'

describe "RecordParser" do
  describe "::read" do
    it "parses a comma-space delimited file and returns an array of arrays" do
      expect(RecordParser.read("./docs/comma.txt", ", ")).to eq([["Abercrombie", "Neil", "Male", "Tan", "2/13/1943"], ["Bishop", "Timothy", "Male", "Yellow", "4/23/1967"], ["Kelly", "Sue", "Female", "Pink", "7/12/1959"]])
    end

    it "parses a pipe delimited file and returns an array of arrays" do
      expect(RecordParser.read("./docs/pipe.txt", " | ")).to eq([["Smith", "Steve", "D", "M", "Red", "3-3-1985"], ["Bonk", "Radek", "S", "M", "Green", "6-3-1975"], ["Bouillon","Francis", "G", "M", "Blue", "6-3-1975"]])
    end

    it "parses a space delimited file and returns an array of arrays" do
      expect(RecordParser.read("./docs/space.txt", " ")).to eq([["Kournikova", "Anna", "F", "F", "6-3-1975", "Red"], ["Hingis", "Martina", "M", "F", "4-2-1979", "Green"], ["Seles", "Monica", "H", "F", "12-2-1973", "Black"]])
    end
  end
end
