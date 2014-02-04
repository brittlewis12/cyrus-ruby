module Parser
  def self.delimit(string)
    string.gsub(/([^\w\/-])+/, ",")
  end

  def self.convert_date(string)
    string.gsub("-", "/")
  end

  def self.sort_color(string)
    array = string.split(",")
    if array[3][0] =~ /[a-z]/i
      dob = array.pop
      color = array.pop
      array << dob << color
    end
    array.join(",")
  end

  def self.remove_middle_initial(string)
    array = string.split(",")
    array.delete_at(2) if array.length == 6
    array.join(",")
  end

  def self.parse(string)
    string = self.delimit(string)
    string = self.convert_date(string)
    string = self.remove_middle_initial(string)
    string = self.sort_color(string)
  end
end
