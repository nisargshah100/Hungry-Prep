class Admin::CandidatesController < Admin::AdminController
  authorize_resource

  def index
    @candidates = Candidate.scoped.where("status <> 'Declined'")
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
