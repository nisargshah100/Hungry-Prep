class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :phone
      t.string :city
      t.string :state
      t.boolean :work_auth
      t.boolean :sponsorship
      t.boolean :criminal
      t.string :gender
      t.string :ethnicity
      t.string :race
      t.string :youtube_link
      t.string :gist_link

      t.timestamps
    end
  end
end
