class RenameAccountIdToAccountId < ActiveRecord::Migration[6.0]
  def change
      rename_column :accounts, :accountId, :account_id
  end
end
