class Admin::AdminController < ActionController::Base
  before_filter :authenticate!

  def authenticate!
  end
end
