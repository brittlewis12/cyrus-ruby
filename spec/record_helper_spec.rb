require 'spec_helper'
require 'pry'
require_relative '../lib/record'
require_relative '../lib/record_helper'

describe RecordHelper do
  include RecordHelper

  let(:britt)   {Record.new(last_name: "Lewis",
                            first_name: "Britt",
                            gender: "Male",
                            birth_date: "4/30/1990",
                            favorite_color: "Blue")}

  let(:raleigh) {Record.new(last_name: "Daniel",
                            first_name: "Raleigh",
                            gender: "Female",
                            birth_date: "12/11/1989",
                            favorite_color: "Teal")}

  let(:shmee)   {Record.new(last_name: "Konowitch",
                            first_name: "Shmee",
                            gender: "Male",
                            birth_date: "5/23/1988",
                            favorite_color: "Rainbows")}

  let(:records) {[britt, raleigh, shmee]}

  describe "#gender_sort" do
    it "sorts an array of record objects by gender (female first), and falls back to last name ascending" do
      expect(gender_sort(records)).to eq([raleigh, shmee, britt])
    end
  end

  describe "#birth_date_sort" do
    it "sorts an array of record objects by birth date ascending" do
      expect(birth_date_sort(records)).to eq([shmee, raleigh, britt])
    end
  end

  describe "#last_name_sort" do
    it "sorts an array of record objects by last name descending" do
      expect(last_name_sort(records)).to eq([britt, shmee, raleigh])
    end
  end

  describe "#convert_to_date" do
    it "converts a date string formatted 'm/d/yyyy' to a date object" do
      expect(convert_to_date("2/6/2014")).to eq(Date.new(2014,2,6))
    end
  end
end
