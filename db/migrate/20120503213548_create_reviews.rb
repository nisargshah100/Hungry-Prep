class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :reviewer_id
      t.integer :candidate_id
      t.text :body

      t.timestamps
    end
  end
end
