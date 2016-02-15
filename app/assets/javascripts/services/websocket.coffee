'use strict'

angular.module 'musicBox'
  .factory 'webSocket',($websocket) ->
    dataStream = $websocket('wss://website.com/data');

    collection = [];

    dataStream.onMessage((message) ->
      collection.push(JSON.parse(message.data));
    );

    methods = {
      collection: collection,
      get: () ->
        dataStream.send(JSON.stringify({ action: 'get' }));
    }
    return methods;
