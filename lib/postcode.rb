$:.<< File.dirname(__FILE__)

require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-serializer'

module Postcode
  class Application < Sinatra::Base
    configure do
      DataMapper::Logger.new(STDOUT, :debug) 
      DataMapper.setup(:postcode, "sqlite3://#{File.expand_path(File.join(File.dirname(__FILE__), '..', 'db', 'postcodes.db'))}")
    end
    
    # mime :json, "application/json"
    # before { content_type :json }
    
    get '/postcode' do
      content_type :html
      haml :about
    end
    
    get '/postcode/states' do
      Postcode::State.all.to_json
    end
    
    get '/postcode/state/:name' do
      if @state = Postcode::State.first(:abbreviation.like => "%#{params[:name]}%")
        @state.localities.to_json
      else
        raise Sinatra::NotFound
      end
    end
    
    get '/postcode/suburbs' do
      Postcode::Locality.all.to_json
    end
    
    get '/postcode/suburb/:name' do
      Postcode::Locality.first(:name.like => "%#{params[:name]}%").to_json
    end
  end
end

require 'models/state'
require 'models/locality'