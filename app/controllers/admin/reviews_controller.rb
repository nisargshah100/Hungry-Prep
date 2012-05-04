class Admin::ReviewsController < Admin::AdminController
  before_filter :lookup_reviews, only: [:edit, :show, :update, :destroy]

  def index
  end

  def new
    @candidate = Candidate.find(params[:candidate_id])
    @review = Review.new
  end

  def create
    @candidate = Candidate.find(params[:candidate_id])
    if review = @candidate.reviews.create(params[:review])
      redirect_to admin_review_path(@candidate.id, review), notice: "Successfully Submitted"
    else
      render 'new', notice: "Please try again"
    end
  end

  def show
    @candidate = Candidate.find(params[:candidate_id])
    @review = @candidate.reviews.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy
    @review.destroy
  end

  private
  def lookup_candidate
    @candidate = Candidate.find(params[:candidate_id])
  end

  def lookup_reviews
    lookup_candidate
    @candidate.reviews
  end

end
