// This makes the smooth scrolling 
$(function() {
 $('a[href*=#]:not([href=#])').click(function() {
   if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
     var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top //- 150
        }, 2000);
        return false;
      }
    }
  });
});


//frame[src*='player.vimeo.com']
//infrome body copy headophile!!!
//$(function(t){
//if(location replace) == this (function(q)) 
//});




//alert("hello");

//confirm("is this working?");

//prompt("what is your name?");
// we can use this so for a blur and then a box with thank u for sending a message
//$("nav").html("hello");

//$("header").css("background","blue");






//and the pixel box!
//background color switch bady!


//$(document).on("scroll", function() {
 // var t = $(document).scrollTop();
  
  //the pixel number changes
  //$("div#distance").html(t + " pixels down");

  //move box acrosspage
  //$("div#distance").css("right", t/5);










  //add this and it will go diagonaly $("div#distance").css("top", t/5);
  //to change the back ground COLOR instead of doing it in index we can do it here!!

  //if (t > 190) { $("body").addClass("nonagram");}
  //else {$("body").removeClass("nonagram");}

  //if (t > 830) {$("body").addClass("kelly");}
  //else {$("body").removeClass("kelly");}

//other way for if/else but in 1 line 
//$("body").toggleClass("kelly",t > 970);


//  }); 



// $(document).ready(function() {
//   // MapTiles for contact map
//   var mapTiles = "https://a.tiles.mapbox.com/v3/riklomas.map-d1djaf1m/{z}/{x}/{y}.png";

//   // BxSlider code
  

//   // Create map and coords
//   var map = L.map('map', {
//     center: [51.540349, -0.102777],
//     zoom: 15,
//     layers: new L.TileLayer(mapTiles)
//   });

//   marker = L.icon({
//     iconUrl: 'images/marker.png',
//     iconRetinaUrl: 'images/marker@2x.png',
//     iconSize: [24, 51]
//   });

//   // Add Map tiles to map
//   L.marker([51.540349, -0.102777], {icon: marker}).addTo(map);
// });



$(document).ready(function() {
  $('.video-slider').bxSlider({
   video: true,
   adaptiveHeight: true,
   useCSS: false,
      mode: 'fade',
      captions: true,


  });
});




//this is new temporanely 


//$("section img").on("click", function(){
  //everything in here runs when i click on an image
//  $("div#lightbox").fadeIn(250);
 // var image = $(this).attr("src");


//  $("div#lightbox img").attr("src", image);
//});


//this will fade out the light box so back to start

//$("div#lightbox").on("click", function(){
 // $("div#lightbox").fadeOut(250);
//});

$(document).scroll(function(){
  

if ($(document).width() > 650) {



      if ($(document).scrollTop()>300) {
        $(".scrollup").fadeIn(500);
      } else {
        $(".scrollup").fadeOut(500);
      }
    
  }

else if ($(document).width()< 650) {

      if ($(document).scrollTop()>100) {
        $(".scrollup").fadeIn(500);
      } else {
        $(".scrollup").fadeOut(500);
      }

}

});
  
  $(".scrollup").click(function(){
  
    $("html,body").animate({scrollTop:0},600);
    return false;









  });

