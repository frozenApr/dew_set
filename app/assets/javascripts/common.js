$(document).ready(function(){
  //登陆下拉菜单
  $(".list_header .drop_down").mouseover(function(){
    $(".drop_menue").css("display", "block");
  });
  $(".list_header .drop_down").mouseout(function(){
      $(".drop_menue").css("display", "none");
  });
});
