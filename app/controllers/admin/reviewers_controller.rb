class Admin::ReviewersController < Admin::AdminController
  before_filter :lookup_reviewer, only: [:show]
  # before_filter :require_super_reviewer, only: [:index]
  load_and_authorize_resource

  def index
    @reviewers = current_user.reviewers
  end

  def show
    @candidates = current_user.candidates
  end

private

  def lookup_reviewer
    @reviewer = Reviewer.find(params[:id])
  end
end