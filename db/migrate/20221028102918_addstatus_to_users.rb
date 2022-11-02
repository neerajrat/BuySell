class AddstatusToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :status, :string , :default => "unblock"
  end
end
