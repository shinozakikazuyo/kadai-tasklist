class ApplicationController < ActionController::Base
  
  #Helperのメソッドを使う
  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
