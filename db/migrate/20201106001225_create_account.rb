class CreateAccount < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :username
      t.text :password_digest
      t.integer :accountType
      t.integer :accountId
    end
  end
end
