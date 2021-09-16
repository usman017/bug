class BugsController < ApplicationController

  before_action :authentication_user
  def index

    @project = Project.find(params[:project_id])
    @bugs = Bug.where(project_id: @project.id)
  end

  def show

    @bug = Bug.find(params[:id])
  end

  def destroy
    @bug = Bug.find(params[:id])
    redirect_to user_projects_path if @bug.destroy
  end

  def all_bug
    @bugs = Bug.all
    render template: 'bugs/bugs'
  end

  def developer_bugs
    @bugs = Bug.where(developer_id: current_user)
    render template: 'bugs/allbugs'
  end


  def new
    @bug = Bug.new
  end

  def edit
    @bug = Bug.find(params[:id])
    @users = User.where(user_type: 'Developer')

  end

  def update

    @bug = Bug.find(params[:id])
    developer_id = params["developer_id"].to_i
    @bug.update({ developer_id: developer_id })
  end

  def create
    @project = Project.find(params[:project_id])
    parameters = bug_params.merge({ user_id: current_user.id, project_id: @project.id })
    @bug = Bug.new(parameters)
    respond_to do |format|
      if @bug.save
        format.html { redirect_to new_project_bug_path, flash: { success: "bugs added" } }
      else
        format.html { render :new }
      end
    end
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :description, { screen_shot:[] }, :typeOf, :status_is, :deadline, :user_id,
                                :project_id)
  end

  def authentication_user
    redirect_to new_user_session_path, notice: 'Login for further actions' unless current_user
  end

end
