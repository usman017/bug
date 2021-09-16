class AddDeveloperToProject < ActiveRecord::Migration[5.1]
  def change
    add_reference :projects, :developer
  end
end
