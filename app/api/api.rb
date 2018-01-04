class API < Grape::API

  prefix 'api'
  format :json

  helpers do
    def authenticate!
      error!('Unauthorized. Invalid or expired token.', 401) unless current_user
    end

    def current_user
      # find token. Check if valid.
      token = ApiKey.where(access_token: headers['Token']).first
      if token && !token.expired?
        @current_user = User.find(token.user_id)
      else
        false
      end
    end

    def token_expires_at
      t = ApiKey.where(access_token: headers['Token']).first
      if t && !t.expired?
        return t.expires_at
      end
    end
  end

  def self.headers_definition
    {
      "Token" => {
        description: "Access Token",
        required: true
      }
    }
  end

  mount ::V1::Ping
  mount ::V1::Auth
  mount ::V1::Store

  if Rails.env.development?
    add_swagger_documentation(
      mount_path: 'swagger_doc',
      hide_format: true,
      api_version: 'v1',
      hide_documentation_path: true,
      info: {
        title: 'API接口文档',
        description: 'Leopard项目接口说明文档 V1'
      }
    )
  end

end
