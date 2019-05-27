class ApplicationController < ActionController::API
  include Knock::Authenticable

  def authorize_admin
    head(:unauthorized) unless !current_user.nil? && current_user.is_admin?
  end
end
