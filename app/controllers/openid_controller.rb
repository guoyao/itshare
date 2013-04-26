class OpenidController < ApplicationController
  def github_auth
    if signed_in? then
      redirect_to root_path
    else
      url = client.auth_code.authorize_url(:redirect_uri => redirect_uri, :scope => 'user')
      redirect_to url
    end
  end

  def github_auth_succeed
    begin
      access_token = client.auth_code.get_token(params[:code], :redirect_uri => redirect_uri)
      emails = JSON.parse(access_token.get('/user/emails').body)
      if emails.count > 0 then
        user = User.find_by_email(emails[0])
        if user.nil? then
          flash[:email_from_openid] = emails[0]
          redirect_to signup_path
        else
          sign_in(user)
          redirect_to root_path
        end
      else
        flash[:error] = t 'openid.errors.auth', target: 'Github'
        redirect_to signin_path
      end
    rescue OAuth2::Error => e
      flash[:error] = t 'openid.errors.auth', target: 'Github'
      redirect_to signin_path
    end
  end

  private

  def client
    # replace 'client_id' & 'client_secret_id' with your real github account info
    client_id = '***********'
    client_secret_id = '**********************************'
    OAuth2::Client.new(client_id, client_secret_id,
                       :site => 'https://api.github.com',
                       :authorize_url => 'https://github.com/login/oauth/authorize',
                       :token_url => 'https://github.com/login/oauth/access_token')
  end

  def redirect_uri(path = '/auth/github/callback', query = nil)
    uri = URI.parse(request.url)
    uri.path  = path
    uri.query = query
    uri.to_s
  end
end