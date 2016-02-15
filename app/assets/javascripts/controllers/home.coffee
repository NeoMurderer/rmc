angular.module 'musicBox'
.controller 'HomeCtrl', ['$scope','$resource','$sce','$timeout','Tracks','angularPlayer','localStorageService', ($scope,$resource,$sce,$timeout,Tracks,angularPlayer,localStorageService,webSocket) ->
	dispatcher = new WebSocketRails(window.location.host + '/websocket?client_token=' + gon.token);

	dispatcher.on_open = (data) ->
    console.log('Connection has been established: ', data)

	dispatcher.bind('fired', (event) ->
		console.log event
		try
		  angularPlayer[event.action](event.params)
		catch error
			console.log error
	)
	$scope.loadTracks = () ->
		Tracks.get().$promise.then (tracks) ->
		 	$scope.tracks = tracks.data.splice(1, tracks.data.length);
		 	localStorageService.set("tracks", $scope.tracks);
			return

	if localStorageService.get('tracks')
		$scope.tracks = localStorageService.get('tracks')
	else
		$scope.loadTracks()
	# $scope.findSong = function() {
	# 	var audiosResource = $resource('/find',{
	# 		name:"@name"
	# 	});
	# 	audiosResource.get({name:$scope.song_name}).$promise.then(function(audios) {
	# 		$scope.audios = audios.data.splice(1, audios.data.length);
	#
	# 	});
	# }

  $scope.playTrack = (track) ->
    $timeout (->
      angularPlayer.playTrack(track.id)
    ), 0
		return
	];
