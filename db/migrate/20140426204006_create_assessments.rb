class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.integer :assessor_id
      t.integer :assessee_id
      t.integer :assessment
      t.timestamps
    end
  end
end
