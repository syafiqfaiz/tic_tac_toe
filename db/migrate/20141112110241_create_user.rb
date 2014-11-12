class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.datetime :updated_at
      t.datetime :created_at
      t.timestamp
    end
  end
end
