class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create

    parameters = project_params.merge({ user_id: current_user.id})
    @project = Project.new(parameters)
    respond_to do |format|
      if @project.save
        format.html { redirect_to new_project_path, flash: {success: 'Project added successfully ' } }
      else
        format.html { render :new }
      end

    end
  end

  def all_project
    @projects = current_user.projects
    render template: 'projects/allProject'
  end
  private
  def project_params
    params.require(:project).permit(:name, :user_id)
  end
end