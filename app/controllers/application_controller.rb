class ApplicationController < ActionController::Base
	#Prevent CSRF attacks by raising an exception
	#For APIs, you may want to use :null_session instead
	protect_from_forgery with: :exception
	# rescue_from Exception, :with => :render_error
	rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
	rescue_from ActionController::RoutingError, :with => :render_not_found
	rescue_from AbstractController::ActionNotFound, :with => :render_not_found


	def index
	end

	#called by last route matching unmatched routes
	#Raises RoutingError which will be rescued from in the same way as other exceptions
	def raise_not_found!
		raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
	end

	def action_missing(m, *args, &block)
		Rails.logger.error(m)
		redirect_to '/*path'
	end

	def routing_error(error = 'Routing error', status = :not_found, exception=nil)
		render_exception(404, "Routing Error", exception)
	end

	#render 404 error
	def render_not_found(e)
		respond_to do |f|
			f.html{ render :template => "errors/404", :status => 404 }
			f.js{ render :partial => "errors/ajax_404", :status => 404 }
		end
	end

	#render action not found error
	def render_not_found(e)
		respond_to do |f|
			f.html{ render :template => "errors/action_not_found", :status => 404 }
			f.js{ render :partial => "errors/ajax_404", :status => 404 }
		end
	end

end
