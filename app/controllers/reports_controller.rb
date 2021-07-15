class ReportsController < ApplicationController
  skip_before_action :authorized, only: [:create, :show, :destroy]

  def create
    user = User.find_by(id: report_params[:user_id])
    project = Project.find_by(id: report_params[:project_id])

    if user && project
      report = Report.new(report_params)
      if report
        report.save
        render json: { report: report }
      else
        render json: { error: 'Report could not be saved'}
      end
    else
      render json: { error: 'User or Report could not be found'}
    end
  end
  
  def show
    report = Report.find_by(id: params[:id])

    if report
      render json: report, include: [:project => { include: [:milestones]}]
    else
      render json: { error: 'report could not be found'}
    end
    
  end

  def destroy
    report = Report.find_by(id: params[:id])

    if report
      report.destroy
      render json: { deletedReportId: report.id}
    else
      render json: { error: "Report could not be found"}
    end
  end


  private

  def report_params
    params.require(:report).permit(:user_id, :project_id, :title, :notes)
  end
end
