class MakeReviewsAJoinTable < ActiveRecord::Migration[5.2]
  
  def up
    Review.destroy_all
    remove_column :reviews, :name
    add_column :reviews, :user_id, :integer
  end

  def down
    Review.destroy_all
    add_column :reviews, :user_id, :integer
    remove_column :reviews, :name
  end
  
end
