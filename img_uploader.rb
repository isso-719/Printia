def img_upload(img)
    img = params[:img]
    tempfile = img[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    content = Content.last
    content.update_attribute(:img, upload['url'])
end