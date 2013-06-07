#This file is used by Rock-based servers to start the application

require ::File.expand_path('../config/environment', __FILE__)
run Feasted::Application
