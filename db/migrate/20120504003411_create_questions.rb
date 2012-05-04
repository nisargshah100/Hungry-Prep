class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :text
      t.string :last_editor, default: "Admin"
      t.timestamps
    end
  end
end
