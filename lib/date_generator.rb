require 'time'
require 'pry'
class DateShift
  attr_reader :date
  def initialize
    @date = date_generator
  end

  def date_generator
    date = Time.now
    month = date.month.to_s
    day = date.day.to_s.ljust(2,"0")
    year = (date.year.to_i) - 2000
    (month + day + year.to_s).to_i
  end
end
