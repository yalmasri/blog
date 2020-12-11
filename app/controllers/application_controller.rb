class ApplicationController < ActionController::API
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
