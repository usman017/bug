class ProjectsDeveloperController < ApplicationController

  def developer_project
    @projects = ProjectsDeveloper.where(developer_id: current_user)
    render template: 'projects/developerProject'
  end

  def show_bugs
    @project = Project.find(params[:project_id])
    @bugs = Bug.where(project_id: @project.id)
    render template: 'projects_developer/bugs'
  end

  def edit_bug
    project_id = params['project_id'].to_i
    bug_id = params['bug_id'].to_i
    @bug = Bug.find(bug_id)
    @project = Project.find(project_id)
    render template: 'projects_developer/editBug'
  end

  def update_bug
    project_id = params['project_id'].to_i
    bug_id = params['bug_id'].to_i
    @bug = Bug.find(bug_id)
    @project = Project.find(project_id)
    @bug.update(edit_project_params)
    respond_to do |format|
      if @bug.save
        format.html { redirect_to developerProject_path, flash: { success: 'Bug updated successfully' } }
      else
        format.html { redirect_to edit_project_path }
      end
    end
  end

  def index
    @project = Project.find(params['project_id'].to_i)
    @project_developer = @project.projects_developers.pluck(:developer_id)
    @users = User.where(user_type: 'Developer').where.not(id: @project_developer)
  end

  def new
    @users = User.where(user_type: 'Developer')
    @project = ProjectsDeveloper.new
  end

  def create
    developer_id = params['developer_id'].to_i
    project_id = params['project_id'].to_i
    @project = ProjectsDeveloper.new({ project_id: project_id, developer_id: developer_id })
    respond_to do |format|
      if @project.save
        format.html {redirect_to projects_path, flash:{ success: 'Project assign successfully' }}
      else
        format.html {redirect_to allBugs_path}
      end
    end
  end

  private

  def edit_project_params
    params.require(:projects_developer).permit(:image, :status_is)
  end

  def project_developer_parama
    params.require(:projects_developer).permit(:project_id, :developer_id)
  end

end
