class Student < ActiveRecord::Base
    has_one :account, dependent: :destroy, :foreign_key => "account_id"
end
