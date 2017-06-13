class SessionController < ApplicationController

  def new
  end

  def create
    email = params["email"]
    password = params["password"]

    operator = Operator.find_by(email: email)
    # If the user exists and you provided the right password
    if operator.present? && operator.authenticate(password)

      session[:operator_id] = operator.id
      redirect_to operator_path(operator)

    else
      flash[:login_error] = "The password or email was incorrect"
      # Show the login form again (potentially with a temporary message)
      render :new # Show the new form
    end
  end

  def destroy
    session[:operator_id] = nil
    redirect_to "/"
  end
  end
