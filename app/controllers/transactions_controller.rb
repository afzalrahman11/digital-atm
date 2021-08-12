class TransactionsController < ApplicationController
  before_action :set_account, only: [:index, :new]
  before_action :authorize_account, only: [:index]

  def index
    @transactions = Transaction.where(account_id: params[:account_id])
  end

  def new
    @transaction = Transaction.new(account_id: @account.id)
    @tr_action = params[:tr_action]
  end

  def create
    @transaction = Transaction.new(
      account_id: params[:account_id], 
      amount: params[:transaction][:amount], 
      tr_action: params[:transaction][:tr_action].capitalize
    )
    if @transaction.save
      flash[:notice] = "Transaction succeeded."
      redirect_to current_user
    else
      flash[:alert] = "Transaction failed :#{@transaction.errors.full_messages}"
      redirect_to current_user
    end
  end

  private

  def set_account
    @account = current_user.accounts.find_by_id(params[:account_id])
  end

  def authorize_account
    unless @account
      flash[:alert] = "You are not allowed to perform that action"
      redirect_to current_user
    end
  end

end