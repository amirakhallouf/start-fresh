class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :location, :string
    add_column :users, :picture, :string
    add_column :users, :education, :string
    add_column :users, :nationality, :string
    add_column :users, :skills, :string
    add_column :users, :bio, :string
  end
end
