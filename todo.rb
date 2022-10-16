require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, "ab9f53e4f022b9d54e8039267fc7704a32ba20279636acb6dfc49ab4840ae3bc"
end

before do
  session[:lists] ||= []
end

get "/" do
  redirect "/lists"
end

get "/lists" do
  @lists = session[:lists]
  erb :lists, layout: :layout
end

get "/lists/new" do
  erb :new_list, layout: :layout
end

post "/lists" do
  session[:lists] << {name: params[:list_name], todos: []}
  redirect "/lists"
end
