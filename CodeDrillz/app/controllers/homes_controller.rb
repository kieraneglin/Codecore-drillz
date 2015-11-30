class HomesController < ApplicationController

  def index
    @drills = Drill.all
    @user_drill = UserDrill.all
  end

  def create
    drill_params = params.permit(:drill_id)
    @user_drill = UserDrill.new(drill_params)
    @user_drill.user = current_user

    if @user_drill.save
      redirect_to(homes_path, notice: "user drill created!")
    else
      render :new
    end
    # render text: drill_params
  end

  def destroy
    @user_drill ||= UserDrill.find params[:id]
    @user_drill.destroy
    flash[:notice] = "Drill deleted successfully"
    redirect_to homes_path
  end

end
