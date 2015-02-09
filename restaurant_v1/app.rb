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
    erb :"foods/all"
  end

  get "/menu/add" do
    erb :"foods/new"
  end

  post '/menu' do
    food = Food.create(params[:food])
    redirect to "/menu/add"
  end


  get "/parties" do
    @parties = Party.all
    erb :"parties/index"
  end

  get "/parties/new" do
    erb :"parties/new"
  end

  post '/party' do
    party = Party.create(params[:party])
    redirect to "/parties"
  end


  get "/orders" do
    @meals = Meal.all
    erb :"meals/index"
  end

  get "/meals/new" do
    @menu = Food.all
    erb :"meals/new"
  end

  post '/meal' do
    meal = Meal.create(params[:meal])
    redirect to "/orders"
  end



  get "/*" do
    "test"
    erb :layout
  end

end
