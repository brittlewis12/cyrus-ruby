require 'csv'

module RecordParser
  def self.read(file_path, options = {})
    delimiter = options.fetch(:delimiter, ",")

    if options[:config]
      records, cfg = [], options[:config]

      CSV.foreach(file_path, col_sep: delimiter) do |row|
        #
        records << Record.new(gender:         row[cfg[:gender]],
                              last_name:      row[cfg[:last_name]],
                              first_name:     row[cfg[:first_name]],
                              birth_date:     row[cfg[:birth_date]],
                              favorite_color: row[cfg[:favorite_color]])
      end

      return records
    else
      return CSV.read(file_path, col_sep: delimiter)
    end
  end
end
