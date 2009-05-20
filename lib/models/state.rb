module Postie
  class State
    include DataMapper::Resource

    def self.default_repository_name; :postie end;

    property :id, Serial
    property :abbreviation, String, :length => 3

    has n, :localities
  end
end