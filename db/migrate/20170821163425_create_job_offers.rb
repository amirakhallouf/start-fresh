class CreateJobOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :job_offers do |t|
      t.references :company, foreign_key: true
      t.string :title
      t.string :location
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
