class Record
  attr_reader :first_name, :last_name, :gender, :favorite_color, :date_of_birth

  def initialize(attrs = {})
    @first_name     = attrs[:first_name]
    @last_name      = attrs[:last_name]
    @favorite_color = attrs[:favorite_color]
    @gender         = wordify(attrs[:gender])
    @date_of_birth  = reformat(attrs[:date_of_birth])
  end

  def to_string
    "#{last_name} #{first_name} #{gender} #{date_of_birth} #{favorite_color}"
  end

  private

  def wordify(gender)
    case gender
    when "M"
      "Male"
    when "F"
      "Female"
    else
      gender
    end
  end

  def reformat(date_str)
    date_str.gsub("-", "/")
  end
end
