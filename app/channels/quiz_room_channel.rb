class QuizRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "quiz_room_#{params[:quiz_room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
