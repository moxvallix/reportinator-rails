module Reportinator::Rails
  class Input < Reportinator::Base
    attribute :value

    def self.input_id
      self::INPUT_ID
    end

    def self.prefix
      return unless input_id.present?
      "#{input_id}_"
    end

    def self.prefix_list
      prefixes = {}
      Reportinator::Rails.config.input_types.each do |type|
        next unless Object.const_defined? type
        type_class = type.constantize
        prefixes[type_class.prefix] = type_class
      end
      prefixes
    end

    def self.find_input(value)
      inputs = prefix_list
      inputs.keys.sort.reverse.each do |key|
        return inputs[key] if value.start_with? key
      end
      nil
    end
  end
end