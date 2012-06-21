class AddHandleToUser < ActiveRecord::Migration
  def change
    add_column :users, :handle, :string
    add_index :users, :handle
  end
end
