$(function(){
  const topBtn =$("#page-top");
  topBtn.hide();

  $(window).scroll(function(){
    const w = $(window).width();
    if ($(this).scrollTop() > 100){
        topBtn.fadeIn();
    } else {
        topBtn.fadeOut();
    }
  });

  topBtn.click(function(){
    $("body,html").animate({
        scrollTop: 0
    }, 500);
    return false;
  });
});