class Response < ActiveRecord::Base
  attr_accessible :body, :candidate, :question

  belongs_to :candidate
  belongs_to :question

  def to_s
    body
  end

end
