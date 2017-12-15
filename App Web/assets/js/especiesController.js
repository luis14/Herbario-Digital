$(".panel-heading,.panel-heading-line-bottom").on("click", function (e) {
  if($(this).find("i").attr('class') == "glyphicon glyphicon-chevron-right"){
      $(this).find("i").removeClass().addClass("glyphicon glyphicon-chevron-down");
  }else{
      $(this).find("i").removeClass().addClass("glyphicon glyphicon-chevron-right");
  }
});
