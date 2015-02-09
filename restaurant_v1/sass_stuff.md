require 'sass'

configure do
  set :scss, {:style => :compressed, :debug_info => false}
end

get '/css/:name.css' do |name|
  content_type :css
  scss "../public/sass/#{name}".to_sym, :layout => false
end
