# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def about
    render 'shared/about'
  end
end
