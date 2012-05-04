class Review < ActiveRecord::Base
  attr_accessible :body, :candidate_id, :reviewer_id, :status, :communication, :reasoning

  belongs_to :candidate
  belongs_to :reviewer
  belongs_to :milestone

  validates :communication, :numericality => { :greater_than => 0, :less_than_or_equal_to => 10 }
  validates :reasoning, :numericality => { :greater_than => 0, :less_than_or_equal_to => 10 }

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

