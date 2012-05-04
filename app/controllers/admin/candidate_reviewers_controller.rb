class Admin::CandidateReviewersController < Admin::AdminController
  authorize_resource

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
    candidate.update_attributes(reviewer_ids: params[:candidate][:reviewer_ids])
    redirect_to admin_candidate_reviewers_path
  end

end
