class CreateProjectsDevelopers < ActiveRecord::Migration[5.1]
  def change
    create_table :projects_developers do |t|
      t.references :project
      t.references :user

      t.timestamps
    end
  end
end
