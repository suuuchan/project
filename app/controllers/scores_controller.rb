class ScoresController < ApplicationController
  def new
    @score = Score.new
  end
  
  def create
    @score = current_user.scores.new(score_params)
    @score.user_id = current_user.id
    if @score.save
      redirect_to scores_path
    else
      render :new
    end
  end
  
   def index
     @users = User.all
     
     
   end
   
   private
   def score_params
     params.require(:score).permit(:score)
   end
end
