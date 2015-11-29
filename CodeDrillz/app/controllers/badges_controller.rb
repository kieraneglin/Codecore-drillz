class BadgesController < ApplicationController

    before_action :badge, only: [:show, :edit, :update, :destroy]

    # ----------------------------------------------------------------------------
      def badge
        @badge ||= Badge.find params[:id]
      end
      def badge_params
        params.require(:badge).permit([:url])
      end
    # ----------------------------------------------------------------------------

    def index
      @badge = Badge.all
    end

    def new
      @badge = Badge.new
    end

    def create
      # render text: badge_params

      @badge = Badge.new(badge_params)
      # @badge.user = current_user
      if @badge.save
        redirect_to(badges_path, notice: "Badge created!")
      else
        render :new
      end
    end
    #
    def show

    end

    def edit
      # redirect_to root_path, alert: "Access denied." unless can? :edit, @badge
    end

    def update
      if @badge.update(badge_params)
        redirect_to badges_path, notice: "Badge updated!"
      else
        render :edit
      end
    end

    def destroy
      @badge.destroy
      flash[:notice] = "Badge deleted successfully"
      redirect_to badges_path
    end


end
