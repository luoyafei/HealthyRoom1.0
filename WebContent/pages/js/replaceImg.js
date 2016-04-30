	$(document).ready(function() {
		var $img = $(".img-thumbnail");
		$img.bind('error', function() {
			this.src = "/HealthyRoom1.0/assets/img/searchNull/123.jpg";
		});
	});
