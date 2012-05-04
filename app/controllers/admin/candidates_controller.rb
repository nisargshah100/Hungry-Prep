class Admin::CandidatesController < Admin::AdminController
  authorize_resource

  def index
    #Status.where(status: params[:status]) if params[:status]
    if params[:status].blank?
      @candidates = Candidate.all
    else
      @candidates = Candidate.find_by_sql(["select candidates.* from candidates INNER JOIN statuses ON statuses.candidate_id == candidates.id WHERE statuses.status == ?;", params[:status]])
    end
  end


  def show

  end

  def update
    if @candidate.update_attributes(params[:candidate])
      redirect_to admin_candidate_path(@candidate), notice: "Successfully Saved"
    else
     redirect_to admin_edit_candidate_path(@candidate), notice: "Please try again"
    end
  end


end
