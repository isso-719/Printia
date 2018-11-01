require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require './models'
require './user_icon_uploader.rb'
require './img_uploader.rb'
require 'securerandom'


enable :sessions

helpers do
  def current_user
    User.find_by(id: session[:user])
  end
end

# not_found do
#     "404 Not Found."
# end

get '/' do
    if current_user.nil?
      @contents = Content.none
    else
      @contents = current_user.contents
    end

    erb :index
end

before '/signin' do
    unless session[:user].nil?
    redirect '/'
    end
end

get '/signin' do
    erb :sign_in
end

post '/signin' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user] = user.id
    end

redirect '/'
end

before '/signup' do
    unless session[:user].nil?
    redirect '/'
    end
end

get '/signup' do
    erb :sign_up
end

post '/signup' do
@user = User.create(
    username: params[:username],
    mail: params[:mail],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
    )

    if params[:user_icon]
        user_icon_upload(params[:user_icon])
    end

    if @user.persisted?
      session[:user] = @user.id
    end

redirect '/'
end

get '/signout' do
    session[:user] = nil
    redirect '/'
end

before '/new/img' do
    if session[:user].nil?
    redirect '/signin'
    end
end

get '/new/img' do
  erb :new_img
end

post '/new/img' do

  def set_content
  @content = Content.friendly.find(params[:id])
  end

  if params[:img]
    current_user.contents.create(
      img_description: params[:img_description]
    )

    img_upload(params[:img])

    redirect '/'
  else
    redirect '/'
  end
end

post '/delete/img/:id' do
  current_user.contents.find(params[:id]).destroy
  redirect '/'
end

before '/edit/img/:id' do
    if session[:user].nil?
    redirect '/signin'
    end
end

post '/edit/img/:id' do
  @content = current_user.contents.find(params[:id])
  erb :edit_img
end

post '/renew/img/:id' do
  @content = current_user.contents.find(params[:id])
  @content.update({
    img_description: params[:img_description]
  })

  redirect '/'
end

post '/view/img/:id' do
  @content = current_user.contents.friendly.find(params[:id])
  erb :view_img_post
end

get '/view/img/:id' do
  @content = Content.friendly.find(params[:id])
  erb :view_img
end

before '/new/group' do
    unless session[:user].nil?
    redirect '/'
    end
end

get '/new/group' do

end