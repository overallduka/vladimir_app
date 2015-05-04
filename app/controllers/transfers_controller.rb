class TransfersController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @transfers_from = Transfer.where(user_id: current_user.id)
    @transfers_to = Transfer.where(to_user: current_user.id)
  end

  def new
    @transfer = Transfer.new
  end

  def create
    transfer = Transfer.create permitted_params
    if transfer.valid?
      redirect_to transfers_path, notice: 'Transfer successfully'
    else
      redirect_to new_transfer_path(transfer), alert: transfer.errors.full_messages.first
    end
  end

  def show
  end


  def permitted_params
    params.require(:transfer).permit(:user_id, :to_user, :amount)
  end
end
