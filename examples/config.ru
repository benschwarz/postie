require 'rubygems'
require File.join(File.dirname(__FILE__), '..', 'lib', 'postie')

use Postie::Application
run Sinatra::Base