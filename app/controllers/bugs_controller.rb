class BugsController < ApplicationController

  before_action :authentication_user
  def index; end

  def show
    @bug = Bug.find(params[:id])
  end

  def destroy
    @bug = Bug.find(params[:id])
    respond_to do |format|
      if @bug.destroy
        format.html { redirect_to allBugs_path, flash: {success: 'Bug has been deleted'}}
      else
        format.html { redirect_to allBugs_path}
      end
    end
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
    @users = User.where(user_type: 'Developer')
    @bug = Bug.find(params[:id])
  end

  def update
    @bug = Bug.find(params[:id])
    developer_id = params["developer_id"].to_i
    @bug.update({developer_id: developer_id})
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
    params.require(:bug).permit(:title, :description, {screen_shot:[]}, :typeOf, :status_is, :deadline, :user_id, 
                                :project_id)
  end

  def authentication_user
    unless current_user
      redirect_to new_user_session_path, notice: 'Login for further actions'
    end
  end

end
