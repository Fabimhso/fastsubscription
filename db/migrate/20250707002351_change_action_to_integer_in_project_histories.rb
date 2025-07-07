class ChangeActionToIntegerInProjectHistories < ActiveRecord::Migration[8.0]
  def change
    change_column :project_histories, :action, :integer, using: 'action::integer'
  end
end
