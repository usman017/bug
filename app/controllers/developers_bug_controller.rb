class DevelopersBugController < ApplicationController

  def index
    @users = User.where(user_type: 'Developer')
    project_id = params['project_id'].to_i
    @project_id = Project.find(project_id)
  end
end
