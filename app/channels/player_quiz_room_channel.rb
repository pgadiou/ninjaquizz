class QuizRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "player_quiz_room_#{params[:player_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
