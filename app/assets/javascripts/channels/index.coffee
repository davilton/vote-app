#= require cable
#= require_self
#= require_tree .

this.App = {}
App.cable = Cable.createConsumer "<%= Rails.env.production? ? Rails.application.config.web_socket_server_url : 'ws://127.0.0.1:28080' %>"