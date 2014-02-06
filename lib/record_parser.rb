require 'csv'

module RecordParser
  def self.read(file_path, delimiter)
    CSV.read(file_path, col_sep: delimiter)
  end
end

# module RecordFactory
# end
