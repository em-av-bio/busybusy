class ExpensesController < ApplicationController

  def index
    @journey = Journey.find(params[:journey_id])
    @expense = Expense.new
    @nicknames = @journey.journey_members.map { |member| member.user.nickname }
  end

  def create
    @journey = Journey.find(params[:journey_id])
    @expense = Expense.new(expense_params)
    @expense.journey = @journey
    if @expense.save!
      redirect_to journey_expenses_path(@journey)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
  end

  private

  def expense_params
    params.require(:expense).permit(:title, :amount, :payer, :recipient, :journey_id)
  end
end
