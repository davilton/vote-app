class VoteActionCable
  # Heroku specific
  # middleware to use websockets if present

  def initialize(app, options={})
    @app = app
    ActionCable.server.config.allowed_request_origins = ["http://localhost:3000"]
  end

  def call(env)
    if Faye::WebSocket.websocket?(env)
      ActionCable.server.call(env)
    else
      @app.call(env)
    end
  end

end