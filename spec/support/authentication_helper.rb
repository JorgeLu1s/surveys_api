module AuthenticationHelper
  def authenticate_user
    user = FactoryBot.create(:user, username: 'user')
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    request.headers.merge!({ "Authorization" => "Bearer #{token}" })
  end

  def authenticate_admin
    user = FactoryBot.create(:user, username: 'admin', role: 'admin')
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    request.headers.merge!({ "Authorization" => "Bearer #{token}" })
  end
end
