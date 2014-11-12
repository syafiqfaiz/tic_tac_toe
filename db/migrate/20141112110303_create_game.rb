class CreateGame < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :player_1
      t.integer :player_2
      t.string :result
      t.datetime :updated_at
      t.datetime :created_at
      t.timestamp
    end
  end
end
