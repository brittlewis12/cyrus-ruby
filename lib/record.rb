class Record
  attr_reader :first_name, :last_name, :gender, :favorite_color, :birth_date

  def initialize(attrs = {})
    @first_name     = attrs[:first_name]
    @last_name      = attrs[:last_name]
    @favorite_color = attrs[:favorite_color]
    @gender         = wordify(attrs[:gender])
    @birth_date     = reformat(attrs[:birth_date])
  end

  def to_string
    "#{last_name} #{first_name} #{gender} #{birth_date} #{favorite_color}"
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
