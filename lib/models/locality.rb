module Postie
  class Locality
    include DataMapper::Resource
    
    def self.default_repository_name; :postie end;
    
    property :id, Serial
    property :name, String
    property :post_code, String, :nullable => false, :length => 5
    property :comments, String
    
    belongs_to :state
    
  end
end