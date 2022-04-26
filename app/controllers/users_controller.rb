class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed followers following discover ]
  before_action :ensure_user_public, only:[:show, :edit,:update,:destroy]

  def ensure_user_public
    if @user.private == true && @user.followers.find_by(username: current_user.username)== nil
      #redirect_to root_path, alert:"Nice try,suckah"
      redirect_back fallback_location: root_path, alert:  "Nice Try Sucka "
      print(@user.followers.find_by(username: current_user.username)!= nil)
      print("hello world")
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