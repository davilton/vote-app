App.votes = App.cable.subscriptions.create 'VotesChannel',
  received: (data) ->
    $('span#total').html(data.votes)