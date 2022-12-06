class WaitingroomChannel < ApplicationCable::Channel
  def subscribed
    journey = Journey.find(params[:id])
    stream_for journey
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
