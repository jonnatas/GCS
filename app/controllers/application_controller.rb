class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  end
  #Overriding the local_request? method
  protected
  def local_request?
    false
  end	

  def rescue_action_in_public(exception)
    case exception
      when ActiveRecord::RecordNotFound
	flash[:error] = "Page doesn't exist!"
        render :file => "#{RAILS_ROOT}/public/404.html", :status => 404
      else
        super
    end
  end

end
