require './config/environment'



use Rack::MethodOverride
use UserController
use CircleController
run ApplicationController
