class Admin::ReviewersController < Admin::AdminController
  before_filter :lookup_reviewer, only: [:show]
  # before_filter :require_super_reviewer, only: [:index]

  def index

  end

  def show

  end

  private

  def lookup_reviewer
    @reviewer = Reviewer.find(params[:id])
  end

end