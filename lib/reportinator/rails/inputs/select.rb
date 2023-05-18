module Reportinator::Rails
  class SelectInput < Input
    INPUT_ID = :select
    PARTIAL = "partials/forms/select"

    def transform
      value
    end
  end
end