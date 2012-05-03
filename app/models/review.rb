class Review < ActiveRecord::Base
  attr_accessible :body, :candidate_id, :reviewer_id, :status
  belongs_to :candidate
  belongs_to :reviewer
  belongs_to :milestone

  def completed?
    not self.body.blank?
  end
end
# == Schema Information
#
# Table name: reviews
#
#  id           :integer         not null, primary key
#  reviewer_id  :integer
#  candidate_id :integer
#  comment      :text
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

