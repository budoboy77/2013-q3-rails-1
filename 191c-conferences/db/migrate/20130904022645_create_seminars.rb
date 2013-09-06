class CreateSeminars < ActiveRecord::Migration
  def change
    create_table :seminars do |t|
      t.string :name
      t.date :start_date
      t.integer :venue_id

      t.timestamps
    end
  end
end
