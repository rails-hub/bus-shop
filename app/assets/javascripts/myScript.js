// gallery		
$(document).ready(function(){	
		   

	    $('#sliderOne').cycle({

	        fx:     'fade',  // effect
            easing: 'linear', // set the easing you want , easeInElastic, easeOutBack  ...
	        speed:  1000,    // speed of transition
	        timeout: 0,    // timeout of the slide
            pause:       false,     // true to enable "pause on hover"
            pauseOnPagerHover: false, // true to pause when hovering over pager link
	        pager:  '#sliderNavList',
           // next:   '#slideshownext',
           // prev:   '#slideshowprev',
		   
	        pagerAnchorBuilder: function(idx, slideModule) {
	            // return sel string for existing anchor
	            return '#sliderNavList li:eq(' + (idx) + ') a';
	        },
            cleartypeNoBg: true,  // fix cleartype inside slides
            cleartype: true  // fix cleartype inside slides
	    });
        $('#sliderNavList li a').click(function() {   $('#sliderOne').cycle('pause');   });
        $('.slideModule').click(function() {   $('#sliderOne').cycle('pause'); 	 });
});
