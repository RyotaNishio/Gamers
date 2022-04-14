class Public::ReportsController < ApplicationController
  def new
    @report = Report.new
    @user = User.find(params[:user_id])
  end
  
  def create
    @report = Report.new(report_params)
    @report.save
    redirect_to success_user_reports_path
  end
  
  def success
  end
  
  private
  
  def report_params
    params.require(:report).permit(:reportor_id, :reported_user_id, :content)
  end
end
