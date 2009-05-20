$:.<< File.dirname(__FILE__)

require 'sinatra'
require 'dm-core'
require 'dm-serializer'
require 'json'

module Postie
  class Application < Sinatra::Base
    configure do
      set :public, File.join(File.dirname(__FILE__), '..', 'public')
      DataMapper::Logger.new(STDOUT, :debug) 
      DataMapper.setup(:postie, "sqlite3://#{File.expand_path(File.join(File.dirname(__FILE__), '..', 'db', 'postcodes.db'))}")
    end
    
    mime :json, "application/json"
    before { content_type :json }
    
    get '/postcode' do
      content_type :html
      erb :about
    end
    
    get '/postcode/states' do
      Postie::State.all.to_json
    end
    
    get '/postcode/state/:name' do
      if @state = Postie::State.first(:abbreviation.like => "%#{params[:name]}%")
        @state.localities.to_json
      else
        not_found
      end
    end
    
    get '/postcode/suburbs' do
      Postie::Locality.all.to_json
    end
    
    get '/postcode/suburb/:name' do
      Postie::Locality.first(:name.like => "%#{params[:name]}%").to_json
    end
    
    not_found do
      {:error => "not found"}.to_json
    end
  end
end

require 'models/state'
require 'models/locality'