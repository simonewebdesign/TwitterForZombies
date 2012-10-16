class ApplicationController < ActionController::Base
  protect_from_forgery

  #private
 
  # Finds the Zombie with the ID stored in the session with the key
  # :current_zombie_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  #def current_zombie
  #  @_current_zombie ||= session[:current_zombie_id] &&
  #    Zombie.find(session[:current_zombie_id])
  #end

end
