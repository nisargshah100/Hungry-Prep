class Candidate < ActiveRecord::Base
  attr_accessible :city, :criminal, :ethnicity, :gender, :gist_link, :phone, :race, :sponsorship, :state, :work_auth, :youtube_link, :user, :status
  has_many :reviews
  has_many :reviewers, through: :reviews
  belongs_to :user
  belongs_to :milestone

  #validates_presence_of :name, :city
  #validates_length_of :city, minimum: 12

  after_create :initialize_milestone

  def name
    user.name
  end

  def phone_number
    phone
  end

  def phone_number=(num)
    phone = num
  end

  def name=(new_name)
    user.name = new_name
  end

  def email
    user.email
  end

  private

  def initialize_milestone
    self.milestone = Milestone.first
  end

end
# == Schema Information
#
# Table name: candidates
#
#  id           :integer         not null, primary key
#  status       :string(255)
#  youtube_url  :string(255)
#  gist_url     :string(255)
#  phone_number :string(255)
#  us_work_auth :boolean
#  city         :string(255)
#  state        :string(255)
#  sponsorship  :boolean
#  criminal     :boolean
#  gender       :string(255)
#  ethnicity    :string(255)
#  race         :string(255)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

