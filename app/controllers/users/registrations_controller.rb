class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    @counter = 0
    @quiz = Quiz.find_by(pin_number: params[:pin_number])
    build_resource(sign_up_params)
    if @quiz
      resource.email = SecureRandom.hex(10) + "@gmail.com"
      resource.password = SecureRandom.hex(10)
      resource.quiz = @quiz
      resource.save
      @counter += 1
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
          @player = resource
          broadcast_wait_room
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      flash[:alert] = "Invalid code"
      render :new
    end

  end


  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    # super(resource)
    quiz_path(resource.quiz)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def broadcast_wait_room
    ActionCable.server.broadcast("quiz_room_#{@quiz.id}", {
      event: "new_team",
      admin_partial: ApplicationController.renderer.render(
          partial: "quiz_questions/quiz_question_admin_wait_room",
          locals: {player: @player, quiz: @quiz, nb_players: @quiz.users.length}),
      player_partial: ApplicationController.renderer.render(
          partial: "quiz_questions/quiz_question_player_wait_room",
          locals: {nb_players: @quiz.users.length}),
      current_user_id: @player.id,
      })
  end

end

