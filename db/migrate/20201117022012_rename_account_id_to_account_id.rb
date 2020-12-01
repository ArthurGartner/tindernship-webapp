# Migration was an attempt to fix join errors AND comply with naming conventions
class RenameAccountIdToAccountId < ActiveRecord::Migration[6.0]
  def change
      rename_column :accounts, :accountId, :account_id
  end
end
