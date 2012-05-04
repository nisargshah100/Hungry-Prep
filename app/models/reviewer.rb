require 'forwardable'

class Reviewer < ActiveRecord::Base
  extend Forwardable

  # attr_accessible :title, :body
  attr_accessible :user

  has_many :reviews
  has_many :candidate_reviewers
  has_many :candidates, through: :candidate_reviewers
  belongs_to :user

  def_delegators :user, :name, :email
end
# == Schema Information
#
# Table name: reviewers
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

