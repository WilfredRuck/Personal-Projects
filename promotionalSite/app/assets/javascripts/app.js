$(document).ready(function(){
	$('#navItem').mouseenter(function(){
		var d = document.getElementById("navItem");
		d.className += " hover";
		console.log("dont forget me!")
		$(this).css("fontSize", "20px");

	});

	$('#navItem').mouseleave(function(){
		$('#navItem').removeClass("hover");
		$(this).css("fontSize","15px");
		console.log("yay");
	});

	
});