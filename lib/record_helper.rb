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

  def birth_date_sort(array)
    array.sort do |a,b|
      if a.birth_date != b.birth_date
        convert_to_date(a.birth_date) <=> convert_to_date(b.birth_date)
      else
        a.last_name <=> b.last_name
      end
    end
  end

  def last_name_sort(array)
    array.sort {|a,b| b.last_name <=> a.last_name}
  end

  def convert_to_date(string)
    Date.strptime(string, "%m/%d/%Y")
  end

  def write_records(array)
    array.each {|rec| puts rec.to_string}
  end
end
