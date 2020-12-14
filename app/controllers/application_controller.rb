# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include ActionView::Helpers::TranslationHelper

  before_action :authenticate!

  attr_reader :current_user, :access_token

  rescue_from StandardError do |err|
    render(
      json: {
        errors: err.message,
        messages: err.message,
        details: err.message
      },
      status: 422
    )
  end

  protected

  def authenticate!
    authenticate_with_token || render_unauthenticated
  end

  def render_unauthenticated
    headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: { errors: 'Unauthenticated!' }, status: :unauthorized
  end

  private

  def authenticate_with_token
    authenticate_with_http_token do |token, options|
      @access_token = AccessToken.find_by token: token
      return unless @access_token
      # return unless @access_token.expires_in > Time.zone.now

      email = options[:email]
      return unless email

      @current_user = User.find_by(id: @access_token.owner_id, email: email)
    end
  end
end
