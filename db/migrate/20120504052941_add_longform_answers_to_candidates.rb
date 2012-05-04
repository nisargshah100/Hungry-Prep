class AddLongformAnswersToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :long_answer_1, :text
    add_column :candidates, :long_answer_2, :text
    add_column :candidates, :long_answer_3, :text
  end
end
