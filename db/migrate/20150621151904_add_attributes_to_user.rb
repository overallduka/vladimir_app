class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :website, :string
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :occupation, :string
    add_column :users, :business_info, :string
    add_column :users, :business_name, :string
    add_column :users, :business_address, :string
    add_column :users, :business_website, :string
    add_column :users, :contact_first_name, :string
    add_column :users, :contact_last_name, :string
    add_column :users, :title, :string
  end
end
