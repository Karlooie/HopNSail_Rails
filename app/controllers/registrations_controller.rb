class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    rides_path
  end
end