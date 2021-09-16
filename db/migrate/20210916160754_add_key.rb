class AddKey < ActiveRecord::Migration[5.1]
  def change
    add_column :bugs, :developer_id, :integer
  end
end
