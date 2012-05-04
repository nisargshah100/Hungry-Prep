class Admin::ReviewsController < Admin::AdminController
  before_filter :lookup_review, only: [:edit, :show, :update, :destroy]

  def index
  end

  def new
    @review = Review.new
  end

  def create
    if review = Review.create(params[:review])
      redirect_to admin_review_path(review), notice: "Successfully Submitted"
    else
      redirect_to admin_edit_review_path(review), notice: "Please try again"
    end
  end

  def show
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
    @candidate = Candidate.includes(:reviews).where(id: params[:candidate_id])
  end

  def lookup_review
    lookup_candidate
    @candidate.first.reviews.find(params[:id])
  end

end
