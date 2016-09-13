class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end
  def show
    @question = Question.find(params[:id])
  end
  def edit
    @question = Question.find(params[:id])
  end
  def new
    @question = Question.new
  end
  def create
    @user = User.find(session[:user_id])
    @question = @user.questions.create(question_params)
    if @question
      flash[:notice] = "Question saved successfully"
      redirect_to questions_path
    else
      flash[:alert] = "Question failed to save"
      render :new
    end
  end
  def update
    @question = @question.update(question_params)
  end
  def destroy
    if @question.delete
      flash[:notice] = "Question deleted"
      redirect_to questions_path
    else
      flash[:alert] = "Question failed to delete"
    end
  end
  private
  def question_params
    params.require(:question).permit(:author, :content, :votes, :user_id)
  end
end
