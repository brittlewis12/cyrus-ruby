require 'csv'

module RecordParser
  def self.read(file_path, options = {})
    delimiter = options.fetch(:delimiter, ",")

    if options[:config]
      config = options[:config]
      records = []

      CSV.foreach(file_path, col_sep: delimiter) do |row|
        records << Record.new(last_name:      row[config[:last_name]],
                              first_name:     row[config[:first_name]],
                              gender:         row[config[:gender]],
                              date_of_birth:  row[config[:date_of_birth]],
                              favorite_color: row[config[:favorite_color]])
      end

      return records
    else
      return CSV.read(file_path, col_sep: delimiter)
    end
  end
end

# module RecordFactory # TODO implement record factory-like module, maybe?
# end

# options = { config, delimiter }

# pipe_config = { # TODO implement more record config params
#   order = "?????"
# }
