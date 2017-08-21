class CreateJobApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :job_applications do |t|
      t.references :user, foreign_key: true
      t.string :status
      t.references :job_offer, foreign_key: true
      t.text :personal_motivation

      t.timestamps
    end
  end
end
