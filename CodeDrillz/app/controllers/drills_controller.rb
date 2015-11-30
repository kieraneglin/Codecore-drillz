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

    # check user's answer and compare if it matches with the solution's correct answer
    if(params[:user_answer])
      solutions = Solution.find_by(correct_answer: params[:user_answer])
      if solutions
        # user answered correctly
        current_user.add_points 10
        @checked_answer = true
        flash[:notice] = 'Answer Correct!'
        redirect_to group_drill_path
        # redirect_to group_drills_path(@group)
        # byebug
      else
        flash[:notice] = 'Answer Incorrect!'
      end
    end
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
