var musicBox = angular.module('musicBox', ['ngResource']);

musicBox.controller('MusicList', ['$scope','$resource','$sce', function($scope,$resource,$sce) {
	var audiosResource = $resource('/find');
	var dispatcher = new WebSocketRails(window.location.host + '/websocket?client_token=' + gon.token);
	dispatcher.on_open = function(data) {
    console.log ('Connection has been established: ', data)
	}; 
	dispatcher.bind('fired',function(data) {
		console.log(data)
	})
	$scope.trustSrc = function(src) {
    	return $sce.trustAsResourceUrl(src);
  	}	
	audiosResource.get().$promise.then(function(audios) {
		$scope.audios = audios.data.splice(1, audios.data.length);

	});
	$scope.playSong = function() {
		var songId = this.audio.aid;
		var audioEl = angular.element("#song_"+songId);
		if(audioEl[0].paused) {
			audioEl[0].play();
		}
		else {
			audioEl[0].pause();
		}
		
	};
}]);