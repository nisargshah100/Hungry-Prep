class Admin::CandidatesController < Admin::AdminController
  load_and_authorize_resource

  def edit

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
