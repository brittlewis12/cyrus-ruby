require 'spec_helper'
require_relative '../lib/record_parser'
require_relative '../lib/record'

describe RecordParser do
  describe "::read" do
    let(:pipe_config) do
      { first_name:     1,
        last_name:      0,
        middle_initial: 2,
        gender:         3,
        birth_date:     5,
        favorite_color: 4 }
    end

    it "defaults to the standard comma-separated csv implementation and returns an array of arrays" do
      expect(RecordParser.read("./spec/test.csv")).to eq([["Lewis","Britt","Male","4/30/1990","Blue"]])
    end

    it "takes a custom delimiter argument in an optional hash" do
      expect(RecordParser.read("./docs/comma.txt", delimiter: ", ")).to eq([["Abercrombie", "Neil", "Male", "Tan", "2/13/1943"], ["Bishop", "Timothy", "Male", "Yellow", "4/23/1967"], ["Kelly", "Sue", "Female", "Pink", "7/12/1959"]])
      expect(RecordParser.read("./docs/pipe.txt", delimiter: " | ")).to eq([["Smith", "Steve", "D", "M", "Red", "3-3-1985"], ["Bonk", "Radek", "S", "M", "Green", "6-3-1975"], ["Bouillon","Francis", "G", "M", "Blue", "6-3-1975"]])
      expect(RecordParser.read("./docs/space.txt", delimiter: " ")).to eq([["Kournikova", "Anna", "F", "F", "6-3-1975", "Red"], ["Hingis", "Martina", "M", "F", "4-2-1979", "Green"], ["Seles", "Monica", "H", "F", "12-2-1973", "Black"]])
    end

    it "takes a custom record config (hash of attributes & indices) in an optional hash and returns an array of Record objects" do
      records = RecordParser.read("./docs/pipe.txt", delimiter: " | ", config: pipe_config)
      records.each do |record|
        expect(record).to be_an_instance_of(Record)
      end
    end
  end
end
