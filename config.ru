require File.dirname(__FILE__) + "/application.rb"

use Rack::ShowExceptions
use Rack::Static, :urls => [ '/favicon.png', '/stylesheets' ], :root => "public"

$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }

FileUtils.mkdir_p 'log' unless File.exists?('log')
log = File.new("log/sinatra.log", "a")
$stdout.reopen(log)
$stderr.reopen(log)

run Application

