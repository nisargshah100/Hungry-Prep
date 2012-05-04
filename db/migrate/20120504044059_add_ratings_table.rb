class AddRatingsTable < ActiveRecord::Migration
  def change
    add_column :reviews, :communication, :integer
    add_column :reviews, :reasoning, :integer
  end
end
