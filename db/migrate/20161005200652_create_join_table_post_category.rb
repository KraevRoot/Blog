class CreateJoinTablePostCategory < ActiveRecord::Migration
  def change
    create_join_table :posts, :categories do |t|
      [:post_id, :category_id]
    end
  end
end
