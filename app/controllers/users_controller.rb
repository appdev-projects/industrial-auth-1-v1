class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed followers following discover ]
  before_action :ensure_current_user_is_feed_and_discover_owner, only: [:feed, :discover]

  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end

    def ensure_current_user_is_feed_and_discover_owner
      if current_user != @user
        redirect_to "#{current_user}/feed" , alert: "You're not authorized to visit that page."
      end
    end

end