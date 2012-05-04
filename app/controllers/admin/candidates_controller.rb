class Admin::CandidatesController < Admin::AdminController
  authorize_resource

  def index
    #Status.where(status: params[:status]) if params[:status]
    if params[:status].blank?
      @candidates = Candidate.all
    else
      # @candidates = Candidate.find_by_sql(["select candidates.* from candidates INNER JOIN statuses ON statuses.candidate_id == candidates.id WHERE statuses.status == ?;", params[:status]])
      @candidates = Candidate.all.select { |candidate| candidate.status.status == params[:status].to_i }
    end
  end


  def show
    @candidate = Candidate.find(params[:id])
  end

  def update
    if @candidate.update_attributes(params[:candidate])
      redirect_to admin_candidate_path(@candidate), notice: "Successfully Saved"
    else
     redirect_to admin_edit_candidate_path(@candidate), notice: "Please try again"
    end
  end


end
