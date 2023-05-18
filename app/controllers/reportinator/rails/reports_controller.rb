module Reportinator::Rails
  class ReportsController < ApplicationController
    include Reportinator::Rails::ReportsHelper
    
    before_action :set_report, only: %i[ show ]
    layout config.report_layout

    # GET /reports
    def index
      # @reports = Report.all
    end

    # GET /reports/1
    def show
      @template = params[:id]
      @params = {template: @template}
      if params[:reportinator_report].present?
        @params.merge!({reportinator_report: params.require(:reportinator_report).permit!})
      end
    end

    def download
      variables = get_report_variables(params[:reportinator_report])
      template = params[:template]
      if template.present?
        loader = get_loader(template, variables)
        set_variables(loader)
        data = @report.to_csv
        filename = "#{template.parameterize}-#{Time.now.strftime("%Y%m%d")}.csv"
        send_data(data, filename: filename)
      else
        redirect_to root_path(template), notice: "Missing template"
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_report
        variables = get_report_variables(params[:reportinator_report])
        loader = get_loader(params[:id], variables)
        set_variables(loader)
      rescue => e
        @report = Reportinator::Report.new
        @report.insert(Reportinator::Row.create("Invalid Table: #{e.to_s}"))
      end

      def get_report_variables(inputs)
        return unless inputs.present?
        transform_params(inputs)
      end

      def get_loader(template, variables)
        Reportinator::ReportLoader.load(template, variables: variables)
      end

      def set_variables(loader)
        return false unless loader.instance_of? Reportinator::ReportLoader
        @loader = loader
        @metadata = loader.get_metadata
        @report = loader.report
      end

      # Only allow a list of trusted parameters through.
      def report_params
        params.fetch(:report, {})
      end
  end
end
