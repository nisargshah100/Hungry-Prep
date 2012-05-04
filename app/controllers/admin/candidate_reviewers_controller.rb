class Admin::CandidateReviewersController < Admin::AdminController
  load_and_authorize_resource

  def index
    @candidates = Candidate.all
    @reviewers = Reviewer.all
  end

  def edit

  end

  def show

  end

  def update
    candidate = Candidate.find(params[:id])
    candidate.update_attributes
    render :json => params
  end

end
