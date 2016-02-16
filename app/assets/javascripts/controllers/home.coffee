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
	$scope.updatePlaylist = () ->
		angularPlayer.clearPlaylist (data) ->
			#add songs to playlist
			if !$scope.tracks
				return
			i = 0
			while i < $scope.tracks.length
				angularPlayer.addTrack $scope.tracks[i]
				i++
			return
		return
	$scope.loadTracks = () ->
		Tracks.get().$promise.then (tracks) ->
		 	$scope.tracks = tracks.data;
		 	localStorageService.set("tracks", $scope.tracks);
			$scope.updatePlaylist()
			return

	if localStorageService.get('tracks')
		$scope.tracks = localStorageService.get('tracks')
		$scope.updatePlaylist()
	else
		$scope.loadTracks()
	$scope.findSong = () ->
		audiosResource = $resource('/find',{
			name:"@name"
		});
		Tracks.get({name:$scope.song_name}).$promise.then((tracks) ->
			$scope.tracks = tracks.data
			$scope.updatePlaylist()
		);


	];
