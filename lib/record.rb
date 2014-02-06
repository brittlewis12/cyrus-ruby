class Record
  attr_reader :first_name, :last_name, :gender, :favorite_color, :date_of_birth

  def initialize(attrs = {})
    @first_name     = attrs[:first_name]
    @last_name      = attrs[:last_name]
    @gender         = attrs[:gender]
    @favorite_color = attrs[:favorite_color]
    @date_of_birth  = attrs[:date_of_birth]
  end

  def to_string
    "#{last_name}, #{first_name}, #{gender}, #{date_of_birth}, #{favorite_color}"
  end
end
