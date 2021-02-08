class ApplicationController < ActionController::API
  API_KEYS = ENV['API_KEYS'].split(', ')

  before_action :ensure_api_key_is_valid

  private

  def ensure_api_key_is_valid
    headers = request.headers

    api_key = headers['X-API-Key'] || headers['Authorization'].split(' ')[1]

    render status: :unauthorized, json: { code: 500, message: 'Unauthorized' } unless (api_key.in? API_KEYS)
  end
end
