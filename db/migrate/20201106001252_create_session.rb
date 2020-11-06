class CreateSession < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.text :sessionhash
      t.integer :accountid
      t.time :logintime
    end
  end
end
