'use strict'

angular.module 'musicBox'
  .factory 'Tracks',($resource) ->
    return $resource("/tracks");
