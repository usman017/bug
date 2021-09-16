class RenameForeignForProject < ActiveRecord::Migration[5.1]
  def change
    rename_column :projects_developers, :user_id, :developer_id
  end
end
