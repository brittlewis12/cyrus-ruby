require_relative './lib/record'
require_relative './lib/record_parser'
require_relative './lib/record_helper'

pipe_config  = {last_name:      0,
                first_name:     1,
                middle_initial: 2,
                gender:         3,
                favorite_color: 4,
                birth_date:     5}

comma_config = {last_name:      0,
                first_name:     1,
                gender:         2,
                favorite_color: 3,
                birth_date:     4}

space_config = {last_name:      0,
                first_name:     1,
                middle_initial: 2,
                gender:         3,
                birth_date:     4,
                favorite_color: 5}

records = RecordParser.read("docs/pipe.txt",
                            delimiter: " | ",
                            config: pipe_config)

records += RecordParser.read("docs/comma.txt",
                            delimiter: ", ",
                            config: comma_config)

records += RecordParser.read("docs/space.txt",
                            delimiter: " ",
                            config: space_config)

include RecordHelper

# TODO change from terminal output to new file output

puts "Output 1 (gender, then last name ascending):\n"
write_records(gender_sort(records))

puts "\nOutput 2 (birth date ascending):\n"
write_records(birth_date_sort(records))

puts "\nOutput 3 (last name descending):\n"
write_records(last_name_sort(records))
