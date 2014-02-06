require 'csv'

module RecordParser
  def self.read(file_path, config = {})
    CSV.read(file_path, col_sep: config.fetch(:delimiter, ","))
  end
end

# module RecordFactory
# end


# pipe_config = {
#   delimiter = " | ",
#   order = "?????"
# }
