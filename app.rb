Dir["models/*.rb"].each do |file|
  require_relative file
end

class Restaurant < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get "/console" do
    Pry.start(binding)
    ""
  end

  get "/menu" do
    @menu = Food.all
    erb :"foods/menu"
  end

  get "/*" do
    "test"
    erb :layout
  end

end
