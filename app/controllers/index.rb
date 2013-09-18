get '/' do
  # Look in app/views/index.erb
  @urls = Url.all
  erb :index
end

get "/create_url" do

  erb :create_url 
end


get '/:id' do
  params[:id]
  @url = Url.where(alter: params[:id])
  @real = @url.first
  p @real.website
  redirect to ("http://#{@real.website}")
end

post '/create_url' do
  p params
  p params[:url]
  @url = Url.new(params[:url])
  @url.newurl
  @url.save
  redirect to ('/')
end



