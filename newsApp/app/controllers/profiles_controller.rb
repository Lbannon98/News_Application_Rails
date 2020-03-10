class ProfilesController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user || current_editor
  end

end