class Review < ActiveRecord::Base
  attr_accessible :why_livingsocial, :why_hungry, :candidate_id, :reviewer_id, :status, :recommendation

  belongs_to :candidate
  belongs_to :reviewer
  belongs_to :milestone

  RATINGS = %w( recommendation )


  def completed?
    !why_livingsocial.blank? && !why_hungry.blank?
  end

  def total_score
    total = RATINGS.inject(0) do |total, rating|
      total += self.send(rating.to_sym)
    end
    total.to_f / RATINGS.count
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

