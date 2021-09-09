class ProjectController < ApplicationController
  def index
  end
  def new
    @project = Project.new
  end

  def create
    parameters = project_params.merge({ user_id: current_user.id})
    @project = Project.new(parameters)
    respond_to do |format|
      if @project.save
        format.html { redirect_to new_project_path, flash: {success: 'Project added successfully ' }}
      else
        format.html {render :new}
      end

    end
  end
  private
  def project_params
    params.require(:project).permit(:name, :user_id)
  end
end
