$(document).ready(function(){
	$('#home').mouseenter(function(){
		var d = document.getElementById("home");
		d.className += " hover";
	});

	$('.hover').hover(function(){
		console.log("Oyeah!");
		$(this).style.size = "50";
	})

	$('#home').mouseleave(function(){
		$('#home').removeClass("hover");
		console.log("yay1");
	});

	
});