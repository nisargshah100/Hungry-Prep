class Question < ActiveRecord::Base
  attr_accessible :title, :text, :last_editor_id

  def get_user_name(id)
    admin = User.find_by_id(id)
    admin.name
  end

end
