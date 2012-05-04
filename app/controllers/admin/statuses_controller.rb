class Admin::StatusesController < Admin::AdminController
  authorize_resource

  def update
    @candidate = Candidate.find(params[:id])
    @candidate.statuses.create(status_id: Status::STATUSES.index(params[:status]))
    redirect_to admin_candidate_reviewers_path
  end

end