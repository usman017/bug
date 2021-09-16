class CreateDevelopersBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :developers_bugs do |t|
      t.references :bug
      t.references :user

      t.timestamps
    end
  end
end
