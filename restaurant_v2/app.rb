Dir["models/*.rb"].each do |file|
  require_relative file
end

# sass

# configure do
#   set :scss, {:style => :compressed, :debug_info => false}
# end
#
# get '/css/:name.css' do |name|
#   content_type :css
#   scss "../public/sass/#{name}".to_sym, :layout => false
# end

class Restaurant < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get "/console" do
    Pry.start(binding)
    ""
  end

  # Foods

  get "/foods/all" do
    @foods = Food.all
    erb :"foods/all"
  end

  get "/foods/new" do
    erb :"foods/new"
  end

  post "/foods" do
    food = Food.create(params[:food])
    redirect to "/foods/all"
  end

  # Parties

  get "/parties/all" do
    @parties = Party.all
    erb :"parties/all"
  end

  get "/parties/new" do
    erb :"parties/new"
  end

  post "/parties" do
    party = Party.create(params[:party])
    redirect to "/parties/all"
  end

  get "/parties/remove/:id" do
    @party = Party.find_by_id(params[:id])
    erb :"parties/remove"
  end

  delete "/parties/remove/:id" do
    # @party = Party.find_by_id(params[:id])
    Party.destroy(@party)
    redirect to "/parties/all"
  end

  # Orders

  get "/orders/all" do
    @orders = Order.all
    erb :"orders/all"
  end

  get "/orders/new/:id" do
    @foods = Food.all
    @party = Party.find_by_id(params[:id])
    @cart = @party.foods
    erb :"orders/new"
  end

  post "/orders" do
    order = Order.create(params[:order])
    redirect to "/orders/new/#{order.party_id}"
  end


  # Catch

  get "/*" do
    "test"
    erb :layout
  end

end
