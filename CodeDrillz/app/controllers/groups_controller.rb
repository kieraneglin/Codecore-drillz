class GroupsController < ApplicationController

	before_action :find_group, {only: [:show, :edit, :update, :destroy]}
 #  before_action :authenticate_user, except: [:index, :show]
 #  before_action :authorize, only: [:edit, :update, :destroy]

 	def index
 		@groups = Group.all
 	end
  def new
    # authenticate_user
    @categories = Category.all
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    render text: group_params
    # @group.user = current_user
    # if @group.save
    #   redirect_to(group_path(@group))
    # else
    #   render :new
    # end
  end

  def show
  end

  def edit
    # redirect_to groups_path, alert: "Access Denied"
  end

  def update
    if  @group.update(group_params)
      redirect_to group_path(@group), notice: "group updated!"
    else
      render :edit
    end
  end

  def index
    @groups = Group.all
  end

  def destroy
    @group.destroy
    flash[:notice] = "group deleted!"
    redirect_to groups_path
  end

  # def authorize
  #   redirect_to groups_path, alert: "Access Denied" unless can? :manage, @q
  # end

  private

  def find_group
    @group = Group.find params[:id]
  end

  def group_params
    params.require(:group).permit([:name, :description, :level, :badges, :points, {category_ids:[]}])
  end

end
