enable :sessions


get '/' do
  # Look in app/views/index.erb

  @urls = Url.all
  erb :index
end

get "/create_url" do

  erb :create_url 
end

get "/account/:id" do
  if session[:id]
    p session[:id]
    @user =User.find(session[:id])
    erb :account
  else
    redirect "/"
  end  
end

get "/logout" do
  session.clear
  redirect to ('/')
end

get '/:id' do
  params[:id]
  @url = Url.where(alter: params[:id])
  @real = @url.first
  @real.countup
  p @real.website
  redirect to ("http://#{@real.website}")
end

post "/login" do

  session.clear
  @user =User.authenticate(params[:user][:email],params[:user][:password])
  if @user == nil
    redirect "/"
  else
    @user=User.find_by_email(params[:user][:email])
    session[:id]=@user.id
    redirect "/account/#{@user.id}"  
  end  
end

post '/create_url' do
  @url = Url.new(params[:url])
  if @url.valid?
    @url.update_attributes(count: 0)
    @url.newurl
    @url.save
    redirect to ('/')
  else
    erb :create_url
  end
end

post '/create_user' do
  @user = User.create(params[:user])
  session[:id] = @user.id
  redirect to ('/account/:id')
end



