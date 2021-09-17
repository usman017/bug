class ProjectsController < ApplicationController

  before_action :authentication_user

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
    @users = User.where(user_type: 'Developer')
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.destroy
        format.html { redirect_to projects_path, flash: {success: 'Project has been deleted successfully'} }
      else
        format.html { redirect_to user_projects_path }
      end
    end
  end


  def update
    @project = Project.find(params[:id])
    @project.update(edit_project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, flash: { success: 'Project updated successfully' } }
      else
        format.html { redirect_to edit_project_path }
      end
    end
  end

  def create
    parameters = project_params.merge({ user_id: current_user.id})
    @project = Project.new(parameters)
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, flash: { success: 'Project added successfully ' } }
      else
        format.html { render :new }
      end
    end
  end

  def all_project
    @project = Project.find(params['project_id'].to_i)
    @project_developer = @project.projects_developers.pluck(:developer_id)
    @users = User.where(user_type: 'Developer').where(id: @project_developer)

    render template: 'projects/allProject'
  end

  private

  def project_params
    params.require(:project).permit(:name, :user_id)
  end

  def edit_project_params
    params.require(:project).permit(:name)
  end

  def projects_developers_params
    params.require(:pro)
  end

  def authentication_user
    unless current_user
      redirect_to new_user_session_path, notice: 'Login for further actions'
    end
  end

end