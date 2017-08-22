class AddDetailsToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :name, :string
    add_column :companies, :location, :string
    add_column :companies, :picture, :string
  end
end
