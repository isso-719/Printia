def user_icon_upload(img)
    img = params[:user_icon]
    tempfile = img[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    user = User.last
    user.update_attribute(:user_icon, upload['url'])
end