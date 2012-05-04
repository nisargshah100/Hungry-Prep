class Admin::QuestionsController < Admin::AdminController
  before_filter :require_admin

  def index
    @questions = Question.all
  end

  def edit
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @question.save
    redirect_to question_path(@question)
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def require_admin
    redirect_to root_url unless current_user and current_user.admin?
  end
end
