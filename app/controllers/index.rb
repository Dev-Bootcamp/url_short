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
  @real.countup
  p @real.website
  redirect to ("http://#{@real.website}")
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



