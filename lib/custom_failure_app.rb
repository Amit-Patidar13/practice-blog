class CustomFailureApp < Devise::FailureApp
  def respond
    http_auth
  end

  def http_auth
    self.status = 401
    self.content_type = 'application/json'
    self.response_body = { status: { code: 401, message: i18n_message } }.to_json
  end
end 