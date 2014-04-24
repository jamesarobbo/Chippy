	$(document).ready(function () {

	$("section#products").isotope();

	$("section nav a#clear").hide();

	$("section nav a").not("section nav a#clear").on("click", function() {
		var category = $(this).attr("id");
		$("section#products").isotope({filter: "div." + category});
		$("nav a#clear").fadeIn();
		return false;

	}); 


	//for out clear button

	$("section nav a#clear").on("click", function() {
		$("section#products").isotope({filter: "*"});
		$("nav a#clear").fadeOut();
		return false;

	});

}); //end of document ready! this launches plug in!!!! 
	//so that the html and the js will load the same time and u dont get switched shit!!
	//iosotope puts the pics automately
