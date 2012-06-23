class CreateProtectedActions < ActiveRecord::Migration
  def change
    create_table :protected_actions do |t|
      t.string :token
      t.integer :user_id
      t.string :action

      t.timestamps
    end
  end
end
