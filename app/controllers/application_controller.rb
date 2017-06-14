class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :fetch_operator

def fetch_operator
  @current_operator = Operator.find_by(id: session[:operator_id])
  if session[:operator_id]
  session[:operator_id] = nil unless @current_operator.present?
  end

end

end
