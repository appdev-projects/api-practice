class ApplicationController < ActionController::Base
  skip_forgery_protection

  respond_to :html, :json

  helper_method :api_user

  def api_user
    if params[:api_user_id]
      # This technique is known as "memoization", to avoid multiple lookups.

      @_api_user ||= User.find(params[:api_user_id])
    end
  end
end
