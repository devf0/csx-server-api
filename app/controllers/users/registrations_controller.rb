# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  
  private

  def respond_with current_user, _opt = {}
    if resource.persisted?
      render json: {
        status: {code: 200, message: 'Signed up successfully'},
        user: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      }, status: :ok
    else
      render json: {
        status: {code: 422, message: "Created fail: #{current_user.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end
end
