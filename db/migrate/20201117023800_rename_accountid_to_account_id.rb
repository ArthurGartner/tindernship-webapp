# Migration was an attempt to fix join errors AND comply with naming conventions
class RenameAccountidToAccountId < ActiveRecord::Migration[6.0]
  def change
      rename_column :sessions, :accountid, :account_id
  end
end
