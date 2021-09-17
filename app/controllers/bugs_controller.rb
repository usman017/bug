class BugsController < ApplicationController

  before_action :authentication_user
  def index

    @project = Project.find(params[:project_id])
    @bugs = Bug.where(project_id: @project.id)
  end

  def show
    @bugs = Bug.find(params[:id])
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
  end

  def update
    @bug = Bug.find(params[:id])
    @bug.update(edit_project_params)
    respond_to do |format|
      if @bug.save
        format.html { redirect_to user_projects_path, flash: { success: 'Bug updated successfully' } }
      else
        format.html { redirect_to edit_project_path }
      end
    end
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

  def edit_developer

    bug_id = params['bug_id'].to_i
    @bug = Bug.find(bug_id)
    project_id = params['project_id'].to_i
    @project = Project.find(project_id)
    @users = User.where(user_type: 'Developer')
    render template: 'bugs/developerAssign'

  end

  def update_developer

    bug_id = params['bug_id'].to_i
    @bug = Bug.find(bug_id)
    developer_id = params['developer_id'].to_i
    @bug.update({ developer_id: developer_id })
  end

  private
  def edit_project_params
    params.require(:bug).permit(:title, :description, :image, :typeOf, :status_is, :deadline)
  end


  def bug_params
    params.require(:bug).permit(:title, :description, :image, :typeOf, :status_is, :deadline, :user_id,
                                :project_id)
  end

  def authentication_user
    redirect_to new_user_session_path, notice: 'Login for further actions' unless current_user
  end

end
