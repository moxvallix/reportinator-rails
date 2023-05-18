module Reportinator::Rails
  class NumberInput < Input
    INPUT_ID = :number
    PARTIAL = "partials/forms/number"

    def transform
      float = (value =~ /\d\.\d/)
      return value.to_f if float.present?
      value.to_i
    rescue
      0
    end
  end
end