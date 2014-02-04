require 'spec_helper'
require_relative '../lib/parser'

describe "Parser" do
  describe "#delimit" do
    it "converts pipe-delimited strings to CSV" do
      expect(Parser.delimit("Smith | Steve | D | M | Red | 3-3-1985")).to eq("Smith,Steve,D,M,Red,3-3-1985")
    end

    it "converts comma-delimited strings to CSV" do
      expect(Parser.delimit("Kelly, Sue, Female, Pink, 7/12/1959")).to eq("Kelly,Sue,Female,Pink,7/12/1959")
    end

    it "converts space-delimited strings to CSV" do
      expect(Parser.delimit("Seles Monica H F 12-2-1973 Black")).to eq("Seles,Monica,H,F,12-2-1973,Black")
    end
  end

  describe "#convert_date" do
    it "changes dates from hyphen-separated to forward slash-separated" do
      expect(Parser.convert_date("1-15-2004")).to eq("1/15/2004")
    end
  end

  describe "#remove_middle_initial" do
    it "takes out the middle initial attribute" do
      expect(Parser.remove_middle_initial("Seles,Monica,H,F,12/2/1973,Black")).to eq("Seles,Monica,F,12/2/1973,Black")
    end
  end

  describe "#sort_color" do
    it "moves color to end of string" do
      expect(Parser.sort_color("Kelly,Sue,Female,Pink,7/12/1959")).to eq("Kelly,Sue,Female,7/12/1959,Pink")
    end

    it "doesn't move anything if the color is in the right place" do
      expect(Parser.sort_color("Seles,Monica,F,12/2/1973,Black")).to eq("Seles,Monica,F,12/2/1973,Black")
    end
  end

  describe "#parse" do
    it "comma-delimits, converts date, removes middle initial, and properly sorts color" do
      expect(Parser.parse("Smith | Steve | D | M | Red | 3-3-1985")).to eq("Smith,Steve,M,3/3/1985,Red")
      expect(Parser.parse("Seles Monica H F 12-2-1973 Black")).to eq("Seles,Monica,F,12/2/1973,Black")
      expect(Parser.parse("Kournikova Anna F F 6-3-1975 Red")).to eq("Kournikova,Anna,F,6/3/1975,Red")
      expect(Parser.parse("Bishop, Timothy, Male, Yellow, 4/23/1967")).to eq("Bishop,Timothy,Male,4/23/1967,Yellow")
    end
  end
end
