class RemoveDeveloper < ActiveRecord::Migration[5.1]
  def change
    remove_column :projects, :developer_id
    remove_column :bugs, :developer_id
  end
end
