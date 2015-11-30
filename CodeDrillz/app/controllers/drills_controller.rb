class DrillsController < ApplicationController
  before_action :drill, only: [:show, :edit, :update, :destroy]

  def drill
    @drill ||= Drill.find params[:id]
  end

  def drill_params
    params.require(:drill).permit(:description, solutions_attributes: [:drill_id, :solution_type, :correct_answer, :_destroy])
  end

  def new
    @group = Group.find params[:group_id]
    @drill = Drill.new
  end

  def create
    @group = Group.find params[:group_id]
    @drill = Drill.new(drill_params)
    @drill.group = @group
    # @drill.user = current_user
    if @drill.save
      redirect_to(group_path(@drill.group), notice: 'Drill is created!')
    else
      render :new
    end
  end

  def show
    @group = Group.find params[:group_id]
    # @drill.solutions.each do |solution|
    #   if(solution.solution_type === 1 ){
    #     if(user-answer === solution.correct_answer){
    #       # undo the hide
    #     end
    #     }
    #   }elsif(solution.solution_type === 2){
    #     if(user-answer is similar to solution.correct_answer){
    #       # undo the hide
    #     end
    #     }
    #   }elsif(solution_type === 3){
    #     if(user-answer passes Rspec test){
    #       # undo the hide
    #     end
    #     }
    #   }
    #   end
    # end
  end

  def edit
    @group = Group.find params[:group_id]
  end

  def update
    @drill.solutions.delete_all
    if @drill.update(drill_params)
      flash[:notice] = 'Drill is updated!'
      redirect_to group_path(@drill.group)
    else
      render :edit
    end
  end

  def destroy
    @drill.destroy
    flash[:notice] = 'Drill deleted successfully'
    redirect_to group_path(@drill.group)
  end
end
