require_relative './lib/record'
require_relative './lib/record_parser'
require_relative './lib/record_helper'

pipe_config  = {last_name:      0,
                first_name:     1,
                middle_initial: 2,
                gender:         3,
                favorite_color: 4,
                date_of_birth:  5}

comma_config = {last_name:      0,
                first_name:     1,
                gender:         2,
                favorite_color: 3,
                date_of_birth:  4}

space_config = {last_name:      0,
                first_name:     1,
                middle_initial: 2,
                gender:         3,
                date_of_birth:  4,
                favorite_color: 5}

include RecordHelper

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

puts "Output 1 (gender, then last name ascending):\n"
generate_output(gender_sort(records))

puts "\nOutput 2 (birth date ascending):\n"
generate_output(birth_sort(records))

puts "\nOutput 3 (last name descending):\n"
generate_output(last_sort(records))
