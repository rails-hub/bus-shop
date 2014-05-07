$(document).ready(function () {
    $('#lead_state').parent().hide();
    states = $('#lead_state').html();
    return $('#lead_country').change(function () {
        var country, escaped_country, options;
        country = $('#lead_country :selected').text();
        escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
        options = $(states).filter("optgroup[label='" + escaped_country + "']").html();
        if (options) {
            $('#lead_state').html(options);
            return $('#lead_state').parent().show();
        } else {
            $('#lead_state').empty();
            return $('#lead_state').parent().hide();
        }
    });
    $('#sliderOne').cycle({
        fx: 'fade',  // effect
        easing: 'linear', // set the easing you want , easeInElastic, easeOutBack  ...
        speed: 1000,    // speed of transition
        timeout: 0,    // timeout of the slide
        pause: false,     // true to enable "pause on hover"
        pauseOnPagerHover: false, // true to pause when hovering over pager link
        pager: '#sliderNavList',
        // next:   '#slideshownext',
        // prev:   '#slideshowprev',

        pagerAnchorBuilder: function (idx, slideModule) {
            // return sel string for existing anchor
            return '#sliderNavList li:eq(' + (idx) + ') a';
        },
        cleartypeNoBg: true,  // fix cleartype inside slides
        cleartype: true  // fix cleartype inside slides
    });
    $('#sliderNavList li a').click(function () {
        $('#sliderOne').cycle('pause');
    });
    $('.slideModule').click(function () {
        $('#sliderOne').cycle('pause');
    });


});

function attach_another_image() {
    count = $('#image_count').val();
    count = parseInt(count) + 1;
    if (count >= 10) {
        alert('You can add maximum of 10 images against a Vehicle')
        return false
    }
    else {
        $('#image_count').val(count);
        div = '<div id="image-upload" class="upload_field"><input type="file" name="bus[images_attributes][' + count + '][image]" id="bus_images_attributes_' + count + '_image"></div>'
        $('#image-upload').append(div);
    }


}



