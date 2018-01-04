module V1
  class Auth < Grape::API
    desc '登录返回Token'
    params do
      requires :login, type: String, desc: 'Username or email address'
      requires :password, type: String, desc: 'Password'
    end
    post :login do
      user = if params[:login].include?('@')
               User.find_by_email(params[:login].downcase)
             else
               User.find_by_login(params[:login].downcase)
           end

      if user && user.authenticate(params[:password])
        ApiKey.clean_history_tokens(user.id)
        key = ApiKey.create(user_id: user.id)
        { token: key.access_token }
      else
        error!('Unauthorized.', 401)
      end
    end

    desc '校验Token是否失效', headers: API.headers_definition
    # params do
    #   requires :token, type: String, desc: 'Access token.'
    # end
    get :authed_ping do
      authenticate!
      { token_expires_at: token_expires_at }
    end
  end
end
