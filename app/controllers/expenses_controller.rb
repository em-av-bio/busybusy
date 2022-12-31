class ExpensesController < ApplicationController

  def index
    @journey = Journey.find(params[:journey_id])
    @journey_members = @journey.journey_members
    @expenses = @journey.expenses
    @expense = Expense.new
    @payers = @journey.journey_members.map { |member| member.user.nickname }
    @nicknames = @journey.journey_members.map { |member| member.user }
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
    redirect_to journey_expenses_path(@expense.journey)
  end

  def balance
    @journey = Journey.find(params[:journey_id])
    @journey_members = @journey.journey_members
    @expenses = @journey.expenses
    @sum = @expenses.sum(:amount)
    @value = @sum / @journey_members.count
    @journey_members.each do |member|
      @depenses_sum = @expenses.where(payer: member.user.nickname).sum(:amount)
      @dettes_sum = 0
      @expenses.each do |expense|
        if expense.recipient.include?(member.user.nickname)
          @dettes_sum += (expense.amount / @journey_members.count)
        end
      end
      member.update(solde: (@depenses_sum - @dettes_sum))
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:title, :amount, :payer, :journey_id, recipient: [])
  end
end
