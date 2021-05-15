# frozen_string_literal: true

class UsersController < ApplicationController # rubocop:todo Style/Documentation
  def profile
    @user = User.find_by_id(params[:user_id])
    @albums = @user.albums.joins(:photos).distinct
  end
end
