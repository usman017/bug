class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
      t.string :title
      t.string :description
      t.string :screen_shot, default: [], array: true
      t.integer :typeOf
      t.integer :status_is
      t.datetime :deadline
      t.references :project
      t.references :developer
      t.references :user

      t.timestamps
    end
  end
end