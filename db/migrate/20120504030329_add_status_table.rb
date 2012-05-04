class AddStatusTable < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :status, :default => 0
      t.string :candidate_id
      t.timestamps
    end
  end
end
