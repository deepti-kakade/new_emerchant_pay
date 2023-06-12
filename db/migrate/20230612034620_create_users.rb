class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.text :description
      t.string :email, null: false
      t.string :password_digest, null: false
      t.decimal :total_transaction_sum, scale: 2, precision: 20, default: 0.0
      t.integer :status, null: false, default: 0
      t.string :type

      t.timestamps
    end
    add_index :users, :status
  end
end
