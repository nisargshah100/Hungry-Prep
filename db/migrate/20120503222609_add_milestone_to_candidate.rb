class AddMilestoneToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :milestone_id, :integer
  end
end
