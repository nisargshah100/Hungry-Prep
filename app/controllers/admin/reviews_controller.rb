class Admin::ReviewsController < Admin::AdminController
  before_filter :lookup_reviews, only: [:edit, :show, :update, :destroy]

  def index
  end

  def new
    @candidate = Candidate.find(params[:id])
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
    @candidate = Candidate.find(params[:candidate_id])
  end

  def lookup_reviews
    lookup_candidate
    instance_variable_set(
      "#{pluralize(review.count, '@review')}".match(/w+/),
      params[:id] ?
      @candidate.reviews :
      @candidate.reviews.where(id: params[:id]))
  end

end
