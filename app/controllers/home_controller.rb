# frozen_string_literal: true

class HomeController < ApplicationController # rubocop:todo Style/Documentation
  def index
    @photos = Photo.order(created_at: :asc).last(25)
  end
end
