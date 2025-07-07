class CreateProjectHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :project_histories do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :action
      t.text :description

      t.timestamps
    end
  end
end
