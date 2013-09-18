get '/' do
  # Look in app/views/index.erb
  @urls = Url.all
  erb :index
end

get '/:id' do
  params[:id]
  @url = Url.where(alter: params[:id])
  @real = @url.first
  # p @real.website
  # redirect to ("#{@real.website}")
end  

get "/create_url" do

  erb :create_url 
end  

