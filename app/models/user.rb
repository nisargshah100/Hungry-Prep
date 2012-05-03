class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body

  def self.new_with_session(email, data)
    self.create!(
      :email => email, 
      :password => Devise.friendly_token[0,20], 
      :name => data['info']['name']) 
  end

  def self.find_for_github_oauth(email, data)
    if user = self.find_by_email(email)
      user
    else
      self.new_with_session(email, data)
    end
  end
end
