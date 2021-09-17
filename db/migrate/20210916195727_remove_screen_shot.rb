class RemoveScreenShot < ActiveRecord::Migration[5.1]
  def change
    remove_column :bugs, :screen_shot
  end
end
