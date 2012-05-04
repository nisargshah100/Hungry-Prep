class HomeController < ApplicationController
  def index
    if current_user
      if current_user.candidate 
        redirect_to edit_candidate_path(current_user.candidate)
      else 
        redirect_to admin_path
      end
    end
  end
end