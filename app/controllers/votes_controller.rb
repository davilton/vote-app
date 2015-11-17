class VotesController < ApplicationController
  

  def index
    @votes = Vote.all.count
  end

  def create
    @vote = Vote.create
    @votes = Vote.all.count
    ActionCable.server.broadcast 'votes', votes: @votes
    # respond_to :html, :js
  end
end
