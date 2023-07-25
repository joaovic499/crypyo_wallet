class WelcomeController < ApplicationController
  def index
    @nome = params[:nome]
    @curso = params[:curso]
  end
end
