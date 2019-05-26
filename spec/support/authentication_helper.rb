module AuthenticationHelper
  def authenticate_user
    user = FactoryBot.create(:user, username: 'admin')
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    request.headers.merge!({ "Authorization" => "Bearer #{token}" })
  end
end
