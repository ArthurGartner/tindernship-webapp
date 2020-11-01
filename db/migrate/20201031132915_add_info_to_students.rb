class AddInfoToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :additional_information, :string
  end
end
