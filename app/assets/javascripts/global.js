$.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function() {

  // UJS authenticity token fix: add the authenticy_token parameter
  // expected by any Rails POST request.
  $(document).ajaxSend(function(event, request, settings) {
    // do nothing if this is a GET request. Rails doesn't need
    // the authenticity token, and IE converts the request method
    // to POST, just because - with love from redmond.
    if (settings.type == 'GET') return;
    if (typeof(AUTH_TOKEN) == "undefined") return;
    settings.data = settings.data || "";
    settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
  });

});


$(window).load(function() {
	$('#slider').nivoSlider({
		effect:'random', //Specify sets like: 'fold,fade,sliceDown'
		slices:15,
		animSpeed:800,
		pauseTime:7600,
		startSlide:0, //Set starting Slide (0 index)
		directionNav:false, //Next & Prev
		directionNavHide:false, //Only show on hover
		controlNav:false, //1,2,3...
		controlNavThumbs:false, //Use thumbnails for Control Nav
      controlNavThumbsFromRel:false, //Use image rel for thumbs
		controlNavThumbsSearch: '.jpg', //Replace this with...
		controlNavThumbsReplace: '_thumb.jpg', //...this in thumb Image src
		keyboardNav:true, //Use left & right arrows
		pauseOnHover:false, //Stop animation while hovering
		manualAdvance:false, //Force manual transitions
		captionOpacity:0.8, //Universal caption opacity
		beforeChange: function(){},
		afterChange: function(){},
		slideshowEnd: function(){} //Triggers after all slides have been shown
	});
});

$(window).load(function() {
        $('#slider1').nivoSlider({
                effect:'random', //Specify sets like: 'fold,fade,sliceDown'
                slices:15,
                animSpeed:800,
                pauseTime:2500,
                startSlide:0, //Set starting Slide (0 index)
                directionNav:false, //Next & Prev
                directionNavHide:false, //Only show on hover
                controlNav:false, //1,2,3...
                controlNavThumbs:false, //Use thumbnails for Control Nav
      controlNavThumbsFromRel:false, //Use image rel for thumbs
                controlNavThumbsSearch: '.jpg', //Replace this with...
                controlNavThumbsReplace: '_thumb.jpg', //...this in thumb Image src
                keyboardNav:true, //Use left & right arrows
                pauseOnHover:false, //Stop animation while hovering
                manualAdvance:false, //Force manual transitions
                captionOpacity:0.8, //Universal caption opacity
                beforeChange: function(){},
                afterChange: function(){},
                slideshowEnd: function(){} //Triggers after all slides have been shown
        });
});


$("ul.thumb li").hover(function() {
	$(this).css({'z-index' : '70'}); /*Add a higher z-index value so this image stays on top*/ 
	$(this).find('img').addClass("hover").stop() /* Add class of "hover", then stop animation queue buildup*/
		.animate({
			marginTop: '-110px', /* The next 4 lines will vertically align this image */ 
			marginLeft: '-110px',
			top: '50%',
			left: '50%',
			width: '150px', /* Set new width */
			height: '150px', /* Set new height */
			padding: '20px'
		}, 200); /* this value of "200" is the speed of how fast/slow this hover animates */

	} , function() {
	$(this).css({'z-index' : '0'}); /* Set z-index back to 0 */
	$(this).find('img').removeClass("hover").stop()  /* Remove the "hover" class , then stop animation queue buildup*/
		.animate({
			marginTop: '0', /* Set alignment back to default */
			marginLeft: '0',
			top: '0',
			left: '0',
			width: '99px', /* Set width back to default */
			height: '99px', /* Set height back to default */
			padding: '3px'
                   }, 400);
});


$("ul.thumb1 li").hover(function() {
        $(this).css({'z-index' : '70'}); /*Add a higher z-index value so this image stays on top*/
        $(this).find('img').addClass("hover").stop() /* Add class of "hover", then stop animation queue buildup*/
                .animate({
                        marginTop: '-70px', /* The next 4 lines will vertically align this image */
                        marginLeft: '-70px',
                        top: '50%',
                        left: '50%',
                        width: '115px', /* Set new width */
                        height: '115px', /* Set new height */
                        padding: '10px'
                }, 200); /* this value of "200" is the speed of how fast/slow this hover animates */

        } , function() {
        $(this).css({'z-index' : '0'}); /* Set z-index back to 0 */
        $(this).find('img').removeClass("hover").stop()  /* Remove the "hover" class , then stop animation queue buildup*/
                .animate({
                        marginTop: '0', /* Set alignment back to default */
                        marginLeft: '0',
                        top: '0',
                        left: '0',
                        width: '99px', /* Set width back to default */
                        height: '99px', /* Set height back to default */
                        padding: '3px'
                   }, 400);
});

