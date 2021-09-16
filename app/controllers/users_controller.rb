class UsersController < ApplicationController

  def developer_index
    @users = User.where(user_type: 'Developer')
    @project_id = Project.find(params[:id])
    render template: 'projects_developer/new'
  end
end
