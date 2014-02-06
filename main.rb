require_relative './lib/record'
require_relative './lib/record_parser'
require 'pry'

pipe_config = {
  last_name:      0,
  first_name:     1,
  middle_initial: 2,
  gender:         3,
  favorite_color: 4,
  date_of_birth:  5
}

comma_config = {
  last_name:      0,
  first_name:     1,
  gender:         2,
  favorite_color: 3,
  date_of_birth:  4
}

space_config = {
  last_name:      0,
  first_name:     1,
  middle_initial: 2,
  gender:         3,
  date_of_birth:  4,
  favorite_color: 5
}

records = []
records << RecordParser.read("docs/comma.txt",
                            delimiter: ", ",
                            config: comma_config)

records << RecordParser.read("docs/pipe.txt",
                            delimiter: " | ",
                            config: pipe_config)

records << RecordParser.read("docs/space.txt",
                            delimiter: " ",
                            config: space_config)

records.flatten!

binding.pry

puts "GENDER, THEN LAST NAME ASCENDING:\n"

gender_last_asc = records.sort do |a,b|
  if a.gender < b.gender
    -1
  elsif a.gender > b.gender
    1
  else
    a.last_name <=> b.last_name
  end
end

gender_last_asc.each {|rec| puts rec.to_string}

puts "\n\nBIRTH DATE ASCENDING:\n"

birth_asc = records.sort do |a,b|
  Date.strptime("#{a.date_of_birth}", "%m/%d/%Y") <=> Date.strptime("#{b.date_of_birth}", "%m/%d/%Y")
end

birth_asc.each {|rec| puts rec.to_string}

puts "\n\nLAST NAME DESCENDING:\n"

last_desc = records.sort {|a,b| b.last_name <=> a.last_name }
last_desc.each {|rec| puts rec.to_string}

