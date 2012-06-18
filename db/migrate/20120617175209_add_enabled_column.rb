class AddEnabledColumn < ActiveRecord::Migration
  def up
    add_column :users, :enabled, :boolean, :default => false
  end

  def down
    remove_column :users, :enabled
  end
end
