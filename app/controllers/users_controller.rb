class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed followers following discover ]

  before_action :ensure_current_user, only: [:feed, :discover]

  def ensure_current_user
    if current_user != @user
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_url )}
        format.json { head :no_content }
      end
    end
  end
  
  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end
end
