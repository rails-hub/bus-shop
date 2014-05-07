//jQuery("table").tablesorter();
$("tr:odd").addClass("odd");
$(".bus_row:odd").mouseenter(function() {
    $(this).css("background","#FCD7A6");
  }).mouseleave(function(){
    $(this).css("background", "#FFF");
  });

	$(".desc").parent().css("background","url('/assets/desc.gif') no-repeat scroll right center");
	$(".asc").parent().css("background","url('/assets/asc.gif') no-repeat scroll right center");
  
  $(".bus_row:even").mouseenter(function() {
      $(this).css("background","#FCD7A6");
    }).mouseleave(function(){
      $(this).css("background", "#EEE");
    });