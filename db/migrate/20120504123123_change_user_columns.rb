class ChangeUserColumns < ActiveRecord::Migration
  def change
    remove_column :reviews, :reasoning
    remove_column :reviews, :communication
    add_column :reviews, :recommendation, :string
  end
end
