require 'rubygems'
require 'bundler'
Bundler.setup

require 'sinatra/base'
require 'haml'
require 'ostruct'

SiteConfig = OpenStruct.new(
                            :title               => 'Is Morgan Freeman Alive?',
                            :author              => 'Ryan Closner',
                            :url_base            => 'http://ismorganfreemanalive.com',
                            :description         => 'Is Morgan Freeman Alive? Check if he is still kicking, or if he has kicked the bucket.',
                            :keywords            => 'morgan freeman alive dead',
                            :google_analytics_id => 'UA-34712228-1',
                            :is_alive            => 'YES'
                            )


class Application < Sinatra::Base

  configure do
    set :public, "#{File.dirname(__FILE__)}/public"
    set :views, "#{File.dirname(__FILE__)}/views"
    set :haml, { :attr_wrapper => '"' }
  end  
  
  get "/" do
    haml :index
  end
  
end

