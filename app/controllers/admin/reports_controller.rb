class Admin::ReportsController < ApplicationController
  def index
    @reports = Report.all.order('created_at DESC')
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to admin_reports_path
  end
end
