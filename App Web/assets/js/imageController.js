// image gallery
// init the state from the input
$(".image-checkbox").each(function () {
  if ($(this).find('input[type="checkbox"]').first().attr("checked")) {
    $(this).addClass('image-checkbox-checked');
  }
  else {
    $(this).removeClass('image-checkbox-checked');
  }
});

// sync the state to the input
$(".image-checkbox").on("click", function (e) {
  $(this).toggleClass('image-checkbox-checked');
  var $checkbox = $(this).find('input[type="checkbox"]');
  $checkbox.prop("checked",!$checkbox.prop("checked"))

  e.preventDefault();
});


//controll the left zoom 
(function() {
var $section = $('#zoom1').first();
$section.find('.panzoom').panzoom({
$zoomIn: $section.find(".zoom-in"),
$zoomOut: $section.find(".zoom-out"),
$zoomRange: $section.find(".zoom-range"),
$reset: $section.find(".reset")
});
})(); 