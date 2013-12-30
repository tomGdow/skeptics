class JscalcController < ApplicationController
  def index

    respond_to do |format|
      format.js
      format.json { render json: @commodities }
      format.html
    end
  end
end
