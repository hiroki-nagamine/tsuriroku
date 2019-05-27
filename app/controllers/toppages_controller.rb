class ToppagesController < ApplicationController
  def index
    if logged_in?
      @record = current_user.records.build
      @records= current_user.records.order('created_at DESC').page(params[:page])
    end
  end
end
