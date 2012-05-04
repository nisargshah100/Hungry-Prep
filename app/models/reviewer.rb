class Reviewer < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :reviews
  has_many :candidates, through: [ :reviews, :user ]
  belongs_to :user
end
# == Schema Information
#
# Table name: reviewers
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

