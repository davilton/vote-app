class VoteActionCable
  # Heroku specific
  # middleware to use websockets if present

  def initialize(app, options={})
    @app = app
  end

  def call(env)
    if Faye::Websockets.websockets?(env)
      ActionCable.server.call(env)
    else
      @app.call(env)
    end
  end

end