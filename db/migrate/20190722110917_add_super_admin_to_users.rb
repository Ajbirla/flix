class AddSuperAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sadmin, :boolean, :default => false
  end
end
