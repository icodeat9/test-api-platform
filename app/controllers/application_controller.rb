class ApplicationController < ActionController::API
  API_KEYS = ENV['API_KEYS'].split(', ')

  before_action :ensure_api_key_is_valid, except: :handle_root_not_found

  def handle_root_not_found
    render json: { message: "route not found"}, status: 404
  end

  private

  def ensure_api_key_is_valid
    headers = request.headers

    unless headers['X-API-Key'].present? || headers['Authorization'].present?
      render status: :unauthorized, json: { code: 500, message: 'Authorization Header not set. Should be X-API-Key or Authorization' }
    end

    api_key = headers['X-API-Key'] || headers['Authorization'].split(' ')[1]

    unless (api_key.in? API_KEYS)
      render status: :unauthorized, json: { code: 500, message: 'Unauthorized' }
    end
  end
end
