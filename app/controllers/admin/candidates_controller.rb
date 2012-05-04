class Admin::CandidatesController < Admin::AdminController
  # before_filter :validate_admin
  before_filter :lookup_candidate, only: [:show, :update, :edit]

  def index
    @candidates = Candidate.all
  end

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

  private

  def lookup_candidate
    @candidate = Candidate.find(params[:id])
  end

end
