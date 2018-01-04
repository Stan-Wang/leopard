module V1
  class Ping < Grape::API

    params do
      optional :val
    end

    desc 'API服务健康检查，返回给定的val值'
    get 'echo' do
      { val: params[:val].to_s, timestamp: Time.now.to_i }
    end
  end
end