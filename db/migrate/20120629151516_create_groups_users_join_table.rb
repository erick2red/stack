class CreateGroupsUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :groups_users, :id => false do |t|
      t.string :group_id
      t.string :user_id
    end
  end
end
