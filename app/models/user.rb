class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body

  has_one :candidate
  has_one :reviewer

  REVIEWER_DOMAINS = [ 'hungrymachine.com', 'livingsocial.com' ]

  def self.new_with_session(email, data)
    user = self.create!(
      :email => email, 
      :password => Devise.friendly_token[0,20], 
      :name => data['info']['name'])
  end

  def self.generate_candidate(user)
    user.create_candidate
  end

  def self.generate_reviewer(user)
    user.create_reviewer
  end

  def self.find_for_github_oauth(email, data, signed_in_resource=nil)
    if not user = self.where(email: email).first
      user = self.new_with_session(email, data)
    end

    generate_candidate(user) if not user.candidate
    user
  end

  def self.find_for_open_id(data, signed_in_resource=nil)
    email = data['info']['email']
    domain = email.split('@').last
    return User.new if not REVIEWER_DOMAINS.include? domain

    if not user = User.where(email: email).first
      user = self.new_with_session(email, data)
    end

    generate_reviewer(user) if not user.reviewer
    user
  end
end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  authentication_token   :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  name                   :string(255)
#

