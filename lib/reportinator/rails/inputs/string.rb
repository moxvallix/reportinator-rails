module Reportinator::Rails
  class StringInput < Input
    INPUT_ID = :string

    def transform
      value.to_s
    rescue
      ""
    end
  end
end