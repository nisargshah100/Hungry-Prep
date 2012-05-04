class Admin::QuestionsController < Admin::AdminController
  authorize_resource

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
    @question.last_editor_id = current_user.id
    @question.save
    redirect_to admin_questions_path
  end

  def update
    @question = Question.find(params[:id])
    @question.update_question(current_user, params[:question])
    redirect_to admin_questions_path
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to admin_questions_path
  end

end
