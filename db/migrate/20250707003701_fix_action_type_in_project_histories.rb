class FixActionTypeInProjectHistories < ActiveRecord::Migration[8.0]
  def change
    remove_column :project_histories, :action
    add_column :project_histories, :action, :integer
  end
end
