class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?

  before_action :track_routes

  def track_routes
    @current_headline = 'CATEGORIES'
    case request.fullpath
    when %r{^/groups/(\d+)$}
      @current_headline = 'CATEGORY EXPENSES'
      session[:previous_route] = '/groups'
      session[:current_route] = request.fullpath
    when %r{^/groups/new(/.*)$}
      @current_headline = 'NEW CATEGORY'
      session[:previous_route] = '/groups'
      session[:current_route] = request.fullpath
    when %r{.*/expense_transactions(/.*)$}
      @current_headline = 'TRANSACTIONS'
      session[:previous_route] = session[:current_route]
      session[:current_route] = request.fullpath
    end

    p('current and previous paths', @current_headline, session[:current_route], session[:previous_route])
  end

  private

  def path_changed?
    # Only trigger the before_action if the path has changed
    session[:current_route] != request.fullpath
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
