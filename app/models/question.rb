class Question < ActiveRecord::Base
  attr_accessible :text, :last_editor_id

  has_many :responses

  def response_for_candidate_id(candidate_id)
    responses.where(candidate_id: candidate_id).first
  end


  def update_question(user, attrs)
    last_editor_id = user.id
    write_attribute(:text, attrs[:text])
    save
  end

end
