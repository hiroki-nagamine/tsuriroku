class ToppagesController < ApplicationController
  def index
    if logged_in?
      @record = current_user.records.build
      @records= current_user.feed_records.order('created_at DESC').page(params[:page])
    end
  end
end
