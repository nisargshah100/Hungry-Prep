class Admin::AdminController < ApplicationController
  before_filter :require_reviewer, except: [:login]
  layout 'admin'

  def login
  end

  private

  def require_reviewer
    unless current_user && current_user.reviewer
      flash[:notice] = "Sorry you are not allowed to access that"
      redirect_to root_path
    end
  end
end
