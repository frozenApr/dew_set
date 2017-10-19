$(document).ready(function(){
  //登陆下拉菜单
  $(".list_header .drop_down").mouseover(function(){
    $(".drop_menue").css("display", "block");
  });
  $(".list_header .drop_down").mouseout(function(){
      $(".drop_menue").css("display", "none");
  });

  //消息列表
  $(".message_bar").click(function(){
    if($(".message_list").css("display") == "none"){
      $(".message_list").css("display", "block");
    }else{
      $(".message_list").css("display", "none");
    }
  });

});
