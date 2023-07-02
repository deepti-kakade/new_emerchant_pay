class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :uuid, null: false, unique: true
      t.string :customer_email, null: false
      t.string :customer_phone, null: false
      t.decimal :amount, scale: 2, precision: 20, default: 0.0
      t.integer :status, null: false, default: 0
      t.string :type
      t.belongs_to :user, foreign_key: true
      
      t.timestamps
    end
  end
end
