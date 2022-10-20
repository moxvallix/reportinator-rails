module Reportinator
  module Rails
    class Report < Loader
      attribute :template

      def self.list
        directories = config.configured_directories.map do |dir|
          config.configured_suffixes.map { |suffix| Dir["#{dir}/**/*#{suffix}"] }.flatten
        end
        directories.flatten.uniq.map { |template| template_name(template)}
      end

      def self.all
        list.map { |template| load(template) }
      end

      def self.sort_and_reverse(array)
        raise "Not an array" unless array.instance_of? Array
        array.sort.reverse
      end

      def self.template_name(path)
        directories = sort_and_reverse(config.configured_directories)
        suffixes = sort_and_reverse(config.configured_suffixes)
        directories.each do |directory|
          next unless path.start_with? directory
          path.delete_prefix! directory
          path.delete_prefix! "/"
          break
        end
        suffixes.each do |suffix|
          next unless path.end_with? suffix
          path.delete_suffix! suffix
          path.delete_suffix! "."
          break
        end
        path
      end

      def self.load(template, additional_params = {})
        report_from_template(template, additional_params)
      end
    end
  end
end