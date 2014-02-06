class Record
  attr_reader :first_name, :last_name, :gender, :favorite_color, :date_of_birth

  def initialize(attrs = {})
    @first_name     = attrs[:first_name]
    @last_name      = attrs[:last_name]
    @favorite_color = attrs[:favorite_color]
    @gender         = wordify_gender(attrs[:gender])
    @date_of_birth  = format_date(attrs[:date_of_birth])
  end

  def to_string
    "#{last_name} #{first_name} #{gender} #{date_of_birth} #{favorite_color}"
  end

  private # TODO perhaps move these methods' logic to record config or record factory once implemented

  def wordify_gender(gender) # FIXME method name...
    case gender
    when "M"
      "Male"
    when "F"
      "Female"
    else
      gender
    end
  end

  def format_date(date)
    date.gsub("-", "/")
  end
end
