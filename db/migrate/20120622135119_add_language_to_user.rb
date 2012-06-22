class AddLanguageToUser < ActiveRecord::Migration
  def up
    add_column :users, :language, :string, :default => :en
  end

  def down
    remove_column :users, :language
  end
end
