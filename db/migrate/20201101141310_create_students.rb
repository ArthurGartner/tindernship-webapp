class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :profilePhotoLink
      t.string :firstName
      t.string :lastName
      t.string :graduationMonth
      t.integer :graduationYear
      t.text :bioText
      t.string :locationPreference1
      t.string :locationPreference2
      t.string :locationPreference3
      t.boolean :fullTime
      t.boolean :partTime
      t.string :resumeLink

      t.timestamps
    end
  end
end
