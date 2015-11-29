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

  def edit
    @group = Group.find params[:group_id]
  end

  def update
    if @drill.update(drill_params)
      redirect_to group_path(@drill.group), notice: 'Drill is updated!'
    else
      render :edit
    end
  end

  def destroy
    @drill.destroy
    flash[:notice] = 'Category deleted successfully'
    redirect_to group_path(@drill.group)
  end
end
