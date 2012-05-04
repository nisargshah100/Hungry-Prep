class QuestionsRemoveTextColumn < ActiveRecord::Migration
  def change
    remove_column :questions, :title
  end
end
