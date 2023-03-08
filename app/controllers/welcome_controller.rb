class WelcomeController < ApplicationController
  def index
    @post = params[:query] ? Post.where("title like ?", "%#{params[:query]}%") : []
    respond_to do |format|
      format.html {}
      format.turbo_stream {
        render turbo_stream: turbo_stream.replace("target", partial: "welcome/results")
      }
    end
  end
end
