module AuthorizationHelper
  def auth_tokens_for_user(email, password)
    post '/authenticate',
      params: { email: email, password: password },
      as: :json

    JSON.parse(response.body)["auth_token"]
  end
end
