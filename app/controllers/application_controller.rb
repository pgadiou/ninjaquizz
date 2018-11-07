class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      @admin = current_admin
      admin_path(@admin)
    else
      super
    end
  end

end


