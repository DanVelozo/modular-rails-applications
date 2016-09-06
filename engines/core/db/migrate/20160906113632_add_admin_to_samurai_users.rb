class AddAdminToSamuraiUsers < ActiveRecord::Migration
  def change
    add_column :samurai_users, :admin, :booleans
  end
end
