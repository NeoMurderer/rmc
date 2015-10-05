# = require jquery
# = require jquery_ujs
# = require websocket_rails/main
# = require_tree .

$(document).ready ->
  dispatcher = new WebSocketRails window.location.host + '/websocket?client_token=' + gon.token

  dispatcher.on_open = (data) ->
    console.log 'Connection has been established: ', data

  dispatcher.bind 'fired', (data) ->
    console.log data
#   function addCommentToDom(comment) {
#   console.log('just received new comment: ' + comment.title);
# }
