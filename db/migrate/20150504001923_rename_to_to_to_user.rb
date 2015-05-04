class RenameToToToUser < ActiveRecord::Migration
  def change
    remove_column :transfers, :to
    add_column :transfers, :to_user, :integer
  end
end
