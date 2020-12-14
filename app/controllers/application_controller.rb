# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  # include ActionController::HttpAuthentication::Token::ControllerMethods
  include ActionView::Helpers::TranslationHelper

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
end
