class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
      t.string :title
      t.string :description
      t.string :screen_shot
      t.integer :type
      t.integer :status
      t.datetime :deadline
      t.references :user

      t.timestamps
    end
  end
end
