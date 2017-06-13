class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :fetch_operator

def fetch_operator
  @current_operator = Operator.find_by(id: session[:operator_id])
  if session[:operator_id]
  session[:operator_id] = nil unless @current_operator.present?
  end
  # check in the session variable
    # if there is a key called :user_id
      # create an instance variable called @current_user
    # if you can't find a user with that ID
        # set session[user_id] to nil
  # if there isnt a key called user_id
    # Do nothing

end

end
