class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed followers following discover ]
  before_action :ensure_private_profiles_inaccessible, only: [:show, :create, :edit, :update, :destroy] 

  def ensure_private_profiles_inaccessible
    visited_user = User.find_by!(username: params.fetch(:username))

    if current_user != visited_user
      if visited_user.private
        if visited_user.followers != "accepted"
          redirect_back(fallback_location: root_url, alert: "not authorized")
        end
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
