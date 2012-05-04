class AddTableCandidateReviewers < ActiveRecord::Migration
  def change
    create_table :candidate_reviewers do |t|
      t.integer :candidate_id
      t.integer :reviewer_id 
    end
  end
end
