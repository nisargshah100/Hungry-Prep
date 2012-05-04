class RemoveBodyAddWhys < ActiveRecord::Migration
  def change
    remove_column :reviews, :body
    add_column :reviews, :why_livingsocial, :text
    add_column :reviews, :why_hungry, :text
  end
end
