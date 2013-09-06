class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.integer :author_id
      t.date :post_date
      t.text :body

      t.timestamps
    end
  end
end
