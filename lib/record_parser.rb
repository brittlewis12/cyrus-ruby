require 'csv'

module RecordParser
  def self.read(file_path, options = {})
    delimiter = options.fetch(:delimiter, ",")

    if options[:config]
      cfg = options[:config]
      records = []

      CSV.foreach(file_path, col_sep: delimiter) do |row|
        records << Record.new(last_name:      row[cfg[:last_name]],
                              first_name:     row[cfg[:first_name]],
                              gender:         row[cfg[:gender]],
                              date_of_birth:  row[cfg[:date_of_birth]],
                              favorite_color: row[cfg[:favorite_color]])
      end

      return records
    else
      return CSV.read(file_path, col_sep: delimiter)
    end
  end
end

# options = { config, delimiter }
