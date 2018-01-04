module V1
  class Store < Grape::API

    # 文件上传
    resource :upload do
      params do
        requires :pic, type: Rack::Multipart::UploadedFile, desc: 'Mulitpart file upload accepts application/pdf'
      end

      post do
        content_type 'image/png'
        avatar = params[:pic]
        attachment = {
          filename: avatar[:filename],
          type: avatar[:type],
          headers: avatar[:head],
          tempfile: avatar[:tempfile]
        }
        storage = Storage.new
        storage.pic = ActionDispatch::Http::UploadedFile.new(attachment)
        storage.file_name = attachment[:filename]
        storage.save
      end
    end
  end
end
