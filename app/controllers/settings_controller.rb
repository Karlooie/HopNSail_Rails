class SettingsController < ApplicationController


  def edit
  end

  def update
    if current_user.update permitted_params.user_settings
      redirect_to root_path, notice: 'Settings updated successfully!'
    else
      render :edit, :flash => { :error => "We're sorry, but something went wrong." }
    end
  end


end