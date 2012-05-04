class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :text
      t.integer :last_editor_id, default: 0
      t.timestamps
    end
  end
end
