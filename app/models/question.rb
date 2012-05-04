class Question < ActiveRecord::Base
  attr_accessible :title, :text, :last_editor_id

  def get_user_name(id)
  end

  def update_question(user, attrs)
    last_editor_id = user.id
    write_attribute(:title, attrs[:title])
    write_attribute(:text, attrs[:text])

    save
  end

end
