class Candidate < ActiveRecord::Base
  extend Forwardable
  attr_accessible :city, :criminal, :ethnicity, :gender, :gist_link, :race, :sponsorship,
    :state, :work_auth, :youtube_link, :user, :status, :name, :phone, :reviewer_ids, :profile_img,
    :resume
 
  has_many :candidate_reviewers
  has_many :responses
  has_many :reviews
  has_many :reviewers, through: :candidate_reviewers
  has_many :statuses, :autosave => true

  belongs_to :user
  belongs_to :milestone
  validates_numericality_of :phone, allow_blank: true

  before_save :fetch_youtube_thumbnail
  after_create :initialize_milestone, :add_status
  def_delegators :user, :name, :email

  mount_uploader :resume, ResumeUploader

  def name=(new_name)
    user.name = new_name
  end

  def update_responses(responses_hash)
    responses_hash.each do |question_id, response|
      r = responses.find_or_create_by_question_id( question_id.to_i)
      r.body = response
      r.save
    end
  end

  def status
    statuses.last
  end

  def total_score
    total = reviews.inject(0) do |total, review|
      total += review.total_score
    end
    
    reviews.count == 0 ? average = 0 : average = total / reviews.count
    (average * 10).round
  end

  def fetch_youtube_thumbnail
    t = ""
    unless self.youtube_link.blank?
      begin
        t = youtube_client.video_by(self.youtube_link || "").thumbnails.first.url
      rescue OpenURI::HTTPError
      end

      self.profile_img = t
    end
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

