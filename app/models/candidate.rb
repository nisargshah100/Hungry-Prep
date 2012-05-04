class Candidate < ActiveRecord::Base
  extend Forwardable
  attr_accessible :city, :criminal, :ethnicity, :gender, :gist_link, :race, :sponsorship, :state, :work_auth, :youtube_link, :user, :status, :name, :phone_number, :reviewer_ids, :profile_img
 
  has_many :reviews
  has_many :candidate_reviewers
  has_many :reviewers, through: :candidate_reviewers
  has_many :statuses

  belongs_to :user
  belongs_to :milestone

  before_save :fetch_youtube_thumbnail
  after_create :initialize_milestone, :add_status
  def_delegators :user, :name, :email

  def phone_number
    phone
  end

  def phone_number=(num)
    phone = num
  end

  def name=(new_name)
    user.name = new_name
  end

  def status
    statuses.last
  end

  def fetch_youtube_thumbnail
    begin
      t = youtube_client.video_by(self.youtube_link).thumbnails.first.url
    rescue OpenURI::HTTPError
      t = ""
    end

    self.profile_img = t
    t
  end

  private

  def youtube_client
    YouTubeIt::Client.new
  end

  def initialize_milestone
    self.milestone = Milestone.first
  end

  def add_status
    statuses.create
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

