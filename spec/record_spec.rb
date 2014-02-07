require 'spec_helper'
require_relative '../lib/record'

describe Record do
  let(:record) {Record.new(last_name: "Abercrombie",
                           first_name: "Neil",
                           gender: "M",
                           favorite_color: "Tan",
                           birth_date: "2-13-1943")}

  describe "#first_name" do
    it "has a first name" do
      expect(record.first_name).to eq("Neil")
    end
  end

  describe "#last_name" do
    it "has a last name" do
      expect(record.last_name).to eq("Abercrombie")
    end
  end

  describe "#gender" do
    it "has a gender that is spelled out" do
      expect(record.gender).to eq("Male")
    end
  end

  describe "#favorite_color" do
    it "has a favorite color" do
      expect(record.favorite_color).to eq("Tan")
    end
  end

  describe "#birth_date" do
    it "has a date of birth that is forward-slash formatted" do
      expect(record.birth_date).to eq("2/13/1943")
    end
  end

  describe "#to_string" do
    it "outputs a string with its last name, first name, gender, date of birth, and favorite color" do
      expect(record.to_string).to eq("Abercrombie Neil Male 2/13/1943 Tan")
    end
  end
end
