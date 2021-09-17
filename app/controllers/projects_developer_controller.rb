class ProjectsDeveloperController < ApplicationController

  def developer_project
    @projects = ProjectsDeveloper.where(developer_id: current_user)
    render template: 'projects/developerProject'
  end



  def index

    @users = User.where(user_type: 'Developer')
    project_id = params['project_id'].to_i
    @project_id = Project.find(project_id)
  end

  def new
    @users = User.where(user_type: 'Developer')
    @project = ProjectsDeveloper.new
  end

  def create
    debugger
    developer_id = params['developer_id'].to_i
    project_id = params['project_id'].to_i
    @project = ProjectsDeveloper.new({ project_id: project_id, developer_id: developer_id})
    respond_to do |format|
      if @project.save
        format.html {redirect_to user_projects_path}
      else
        format.html {redirect_to allBugs_path}
      end
    end
  end

  private

  def project_developer_parama
    params.require(:projects_developer).permit(:project_id, :developer_id)
  end

end