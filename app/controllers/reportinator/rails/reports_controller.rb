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
    end

    def update
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_report
        if params[:reportinator_report].present?
          @variables = transform_params(params[:reportinator_report])
        end
        @loader = Reportinator::ReportLoader.load(params[:id], variables: @variables)
        @metadata = @loader.get_metadata
        @report = @loader.report
        @template = params[:id]
      # rescue
      #   @report = Reportinator::Report.new
      #   @report.insert(Reportinator::Row.create("Invalid Table"))
      end

      # Only allow a list of trusted parameters through.
      def report_params
        params.fetch(:report, {})
      end
  end
end
