module Reportinator::Rails
  module ReportsHelper

    def transform_params(variables)
      new_variables = {}
      variables.each do |key, value|
        new_variables.merge! transform_variable(key, value)
      end
      new_variables
    end

    def transform_variable(key, value)
      variable = key.to_s
      input_class = Reportinator::Rails::Input.find_input(variable)
      return false unless input_class.present?
      new_value = input_class.new(value: value).transform
      new_key = variable.sub(input_class.prefix, "").to_sym
      {new_key => new_value}
    end
  end
end
