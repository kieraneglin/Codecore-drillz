class DrillsController < ApplicationController

  before_action :drill, only: [:create, :show, :edit, :update, :destroy]

  # ----------------------------------------------------------------------------
    def drill
      @drill ||= Drill.find params[:id]
    end

    def drill_params
      params.require(:drill).permit(:description)
    end
  # ----------------------------------------------------------------------------
  def create
    @group = Group.find params[:group_id]
    @drill.group = @group
    # @drill.user = current_user
    if @drill.save
      redirect_to(groups_path(@drill.group), notice: "Drill is created!")
    else
      render :new
    end
  end

  # def show
  #   @group ||= Group.find params[:id]
  #   group_params = params.require(:group).permit([:name])
  #   @group = Group.new(group_params)
  # end

  def edit

  end

  def update
    if @drill.update(drill_params)
      redirect_to groups_path(@drill.group), notice: "Drill is updated!"
    else
      render :edit
    end
  end

  def destroy
    @drill.destroy
    flash[:notice] = "Category deleted successfully"
    redirect_to groups_path(@drill.group)
  end
end
