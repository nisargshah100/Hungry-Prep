class AddResumeToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :resume, :string
  end
end
