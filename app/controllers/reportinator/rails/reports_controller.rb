module Reportinator::Rails
  class ReportsController < ApplicationController
    before_action :set_report, only: %i[ show ]

    # GET /reports
    def index
      # @reports = Report.all
    end

    # GET /reports/1
    def show
    end

    def update
      @variables = params[:reportinator_report]
      @report = Report.load(params[:id], variables: @variables)
      respond_to do |format|
        format.html { render :show, location: root_path }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_report
        @report = Report.load(params[:id])
        @template = params[:id]
      # rescue
      #   redirect_to root_path
      end

      # Only allow a list of trusted parameters through.
      def report_params
        params.fetch(:report, {})
      end
  end
end
