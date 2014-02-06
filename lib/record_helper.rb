module RecordHelper
  def gender_sort(array)
    array.sort do |a,b|
      if a.gender != b.gender
        a.gender <=> b.gender
      else
        a.last_name <=> b.last_name
      end
    end
  end

  def birth_sort(array)
    array.sort do |a,b|
      convert_date(a.date_of_birth) <=> convert_date(b.date_of_birth)
    end
  end

  def last_sort(array)
    array.sort {|a,b| b.last_name <=> a.last_name}
  end

  def convert_date(string)
    Date.strptime(string, "%m/%d/%Y")
  end

  def generate_output(array)
    array.each {|rec| puts rec.to_string}
  end
end
