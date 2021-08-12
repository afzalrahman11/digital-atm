class AccountsController < ApplicationController
  before_action :set_account, only: [:show]
  skip_before_action :require_user, only: [:index]

  def show
    
  end

  def index
    @accounts = Account.all
  end

  private

    def set_account
      @account = Account.find(params[:id])
    end

    def require_same_user
      if current_user != @account.user
        flash[:alert] = "Invalid request"
        redirect_to @account
      end
	  end

end