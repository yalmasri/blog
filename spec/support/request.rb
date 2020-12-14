module Request
  # JSON Helpers
  module JsonHelpers
    def js_res
      @js_res ||= JSON.parse(response.body, symbolize_names: true)
    rescue
      {}
    end
  end
end
