class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.decimal :amount, precision: 8, scale: 2
      t.integer :user_id
      t.integer :to

      t.timestamps null: false
    end
  end
end
