// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

function check(sel) {
  check_v = $("#select_size_"+sel+" :selected").val() + "-" + $("#select_dough_"+sel+" :selected").val()
  $('.price'+sel).text('Недоступна');
  $('#select_'+sel+' option').each(function(){
    if (this.text === check_v) {
      size = $("#select_size_"+sel+" :selected").val();
      dough = $("#select_dough_"+sel+" :selected").val();
      price = $("#select_price_"+sel+" :selected").text();
      name = $("#name_pizza_"+sel).text();
      url = $("#url_pizza_"+sel).text();
      $('.price'+sel).text($("#select_price_"+sel+" :selected").text()+' р.');
      $('input#btn_keeper_'+sel).parent().parent().attr('action','/line_items?pizza=true&id='+sel+'&size='+size+'&dough='+dough+'&price='+price+'&name='+name+'&url='+url);
    }
  });
  if ($('.price'+sel).text() === 'Недоступна') {
    $('input#btn_keeper_'+sel).parent().parent().attr('action','/line_items?error=true');
  }
};

function select_size(sel, id) {
  $("#select_size_"+sel).val(id)
  $("#select_price_"+sel).val(id)
  check(sel);
};

function select_dough(sel, id) {
  $("#select_dough_"+sel).val(id)
  check(sel);
};

$(document).ready(function() {
  $(".psize").click(function() {
    $(this).parent().children(".psize").each(function() {
      return $(this).removeClass("active");
    });
    return $(this).toggleClass("active");
  });
  return $(".duff-one").click(function() {
    $(this).parent().children(".duff-one").each(function() {
      return $(this).removeClass("duff-one-active");
    });
    return $(this).toggleClass("duff-one-active");
  });
});

function checkSymbol() {
  if ((event.keyCode < 48) || (event.keyCode > 57))
  {
    event.returnValue = false;
  }
  else
  {
    true;
  }
};

//hs.graphicsDir = '/highslide/graphics/';
//hs.align = 'center';
//hs.transitions = ['expand', 'crossfade'];
//hs.outlineType = 'rounded-white';
//hs.fadeInOut = true;
////hs.dimmingOpacity = 0.75;
//
//// Add the controlbar
//hs.addSlideshow({
//    //slideshowGroup: 'group1',
//    interval: 5000,
//    repeat: false,
//    useControls: true,
//    fixedControls: 'fit',
//    overlayOptions: {
//    opacity: .75,
//    position: 'bottom center',
//    hideOnMouseOut: true
//    }
//});



