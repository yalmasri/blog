class SessionsController < ApplicationController
  before_action :set_user, only: [:create]

  # POST /login
  def create
    if can_sign_in?
      render(json: sign_in, status: 201, meta: {})
    else
      render_error
    end
  end

  # DELETE /logout
  def destroy
  end

  private

  def sign_in
    access_token = @user.generate_access_token!
    {
      email: @user.email,
      token: access_token.token
    }
  end

  def render_error
    render(
      json: {
        errors: [error_message],
        messages: [error_message],
        details: [error_code]
      },
      status: :unprocessable_entity, #422
      meta: {}
    )
  end

  def password
    params[:password]
  end

  def email
    params[:email]
  end

  def error_code
    return @user.unauthenticated_message unless @user&.valid_password?(password)
    return @user.unauthenticated_message if @user&.active_for_authentication?

    @user.inactive_message
  end

  def error_message
    t("devise.failure.#{error_code}", authentication_keys: User.human_attribute_name(:email))
  end

  def can_sign_in?
    @user&.valid_password?(password) && @user&.active_for_authentication?
  end

  def set_user
    @user = User.find_for_database_authentication(email: email) || User.new
  end
end
