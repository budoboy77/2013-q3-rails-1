class EncyclopediaEntries < ActiveRecord::Migration
  def up
  	create table :encyclopediaentries do |t|
  	  t.string = :word,
  	  t.text = :content
  	end
  end

  def down
  	drop_table :encyclopediaentries
  end
end
