module Reportinator::Rails
  class DateInput < Input
    INPUT_ID = :date

    def transform
      Time.parse(value)
    rescue
      Time.now
    end
  end
end