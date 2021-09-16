class RenameForeignkeyForBugs < ActiveRecord::Migration[5.1]
  def change
    rename_column :developers_bugs, :user_id, :developer_id
  end
end
