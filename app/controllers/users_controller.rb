class UsersController < ApplicationController
  before_action :set_user
  before_action :require_same_user, only: [:show]

  def show
    @accounts = @user.accounts
  end

  private

    def require_same_user
      if @user != current_user
        flash[:alert] = "You can not perform that action"
        redirect_to current_user
      end
    end

    def set_user
      @user = User.find(params[:id])
    end

end