function positionLightboxImage() {
  var top = ($(window).height() - $('#lightbox').height()) / 2;
  var left = ($(window).width() - $('#lightbox').width()) / 2;
  $('#lightbox')
    .css({
      'top': top,
      'left': left
    })
    .fadeIn();
};

function removeLightbox() {
  $('#overlay, #lightbox')
    .fadeOut('slow', function() {
      $(this).remove();
      $('body').css('overflow-y', 'auto'); // show scrollbars!
    });
};
 
function appendLightboxOverlay () {
  $('<div id="overlay"></div>')
    .css('top', '0')
    .css('opacity', '0')
    .animate({'opacity': '0.8'}, 'slow')
    .appendTo('body');
  $('<div id="lightbox"></div>')
    .hide()
    .appendTo('body');
  $('<a class="closePopUp"></a>')
    .appendTo('#lightbox');
};

$(document).ready(function() {
  $('a.lightbox').click(function(e) {

    $('body').css('overflow-y', 'hidden'); // hide scrollbars!
    appendLightboxOverlay();
    positionLightboxImage();
    $('<img id="light-img">')
      .attr('src', $(this).attr('href'))
      .load(function() {
        var img_top = ($(window).height() - $('#light-img').height()) / 2;
        var img_left = ($(window).width() - $('#light-img').width()) / 2;
        $('#light-img').css({'top': '30px', 'left': img_left});
        positionLightboxImage();
      })
      .click(function() {
        removeLightbox();
      })
      .appendTo('#lightbox')
      .css({'top': img_top,
      'left': img_left});
    $('#overlay').click(function() {
      removeLightbox();
    });
    $('.closePopUp').click(function() {
        removeLightbox();
    });
    $('#lightbox').fadeIn();
    return false;
  });
});

$(document).ready(function() {
  $('#beer').click(function(e) {
    appendLightboxOverlay();
    positionLightboxImage();
    if ($('.apply')) {

    }
    else {
        $(' <div id="apply" class="pop-up"><h4>Есть ли вам 18 лет?</h4><a class="variant2" href="/products/beer" data-remote="true" id="adultEn">Да</a><a class="variant2" href="#" id="notAdult">Нет</a></div>')
        .load(function() {
          var top = ($(window).height() - $('#lightbox').height()) / 2;
          var left = ($(window).width() - $('#lightbox').width()) / 2;
          $('#lightbox')
            .css({
              'top': top,
              'left': left
            })
            .fadeIn();
        })
        .appendTo('#lightbox');
    }
    $('#lightbox').fadeIn();
    $('#adultEn').click(function() {
      removeLightbox();
    });
    $('#overlay').click(function() {
      removeLightbox();
    });
    $('.closePopUp').click(function() {
        removeLightbox();
    });
    $('#apply a').click(function() {
      removeLightbox();
    });
    return false;
  });
});

function appendClosetTimeBlock (from, till) {
  appendLightboxOverlay();
  positionLightboxImage();
  $('<div id="closet-time" class="pop-up"><h6>Извините, вы вошли в меню он-лайн заказа в нерабочее время.</h6><h6>c '+from+' до '+till+' доставка не работает.</h6><h6>Если же вы хотите просто ознакомиться с меню</h6><h6>или заказать отсроченную доставку - закройте данное сообщение.</h6><a class="close-msg" id="contShop"><img src="/assets/x.png"></a></div>')
    .load(function() {
      var top = ($(window).height() - $('#lightbox').height()) / 2;
      var left = ($(window).width() - $('#lightbox').width()) / 2;
      //$('#lightbox')
      //  .css({
      //    'top': top,
      //    'left': left
      //  })
      //  .fadeIn();
    })
    .appendTo('#lightbox');
  $('#lightbox').fadeIn();

  $('#lightbox')
    .css({
      'width': '800px',
      'background-image': 'linear-gradient(rgb(252, 230, 108) 1%, rgb(253, 176, 0) 99%)'
    });

  var top = ($(window).height() - $('#lightbox').height()) / 2;
  var left = ($(window).width() - $('#lightbox').width()) / 2;


  $('#lightbox')
    .css({
      'top': top,
      'left': left
    });
  $('#overlay').click(function() {
    removeLightbox();
  });
  $('.closePopUp').click(function() {
        removeLightbox();
    });
  $('#contShop').click(function() {
    removeLightbox();
  });
  return false;
};

function lanchNotAvailable () {
  appendLightboxOverlay();
  positionLightboxImage();
  $('<div id="lanchNotAvailable" class="pop-up"><h4>Заказать возможно с 11 до 16 у оператора</h4><a class="variant2" id="contShop">Продолжить покупки</a></div>')
    .load(function() {
      var top = ($(window).height() - $('#lightbox').height()) / 2;
      var left = ($(window).width() - $('#lightbox').width()) / 2;
      $('#lightbox')
        .css({
          'top': top,
          'left': left
        })
        .fadeIn();
    })
    .appendTo('#lightbox');
  $('#lightbox').fadeIn();
  $('#overlay').click(function() {
    removeLightbox();
  });
  $('#contShop').click(function() {
    removeLightbox();
  });
  $('.closePopUp').click(function() {
        removeLightbox();
    });
  return false;
};

function willBeSoon (hours, mins) {
  appendLightboxOverlay();
  positionLightboxImage();
  $('<div id="willBeSoon" class="pop-up"><h4>Ланчи будут доступны через</h4><h5>'+hours+':'+mins+'</h5><a class="variant2" id="contShop">Продолжить покупки</a></div>')
    .load(function() {
      var top = ($(window).height() - $('#lightbox').height()) / 2;
      var left = ($(window).width() - $('#lightbox').width()) / 2;
      $('#lightbox')
        .css({
          'top': top,
          'left': left
        })
        .fadeIn();
    })
    .appendTo('#lightbox');
  $('#lightbox').fadeIn();
  $('#overlay').click(function() {
    removeLightbox();
  });
  $('#contShop').click(function() {
    removeLightbox();
  });
  $('.closePopUp').click(function() {
    removeLightbox();
    });  
  return false;
};


//Убираем кнопки "заказать" со страниц ланчи и наборы. Добавляем на страницы строку с текстом о том, что заказ невозможен.

function hideCheckButton () {
  $('.sets-page-panail .box .variant2 , .lunches-page-panail .box .variant2').hide();
  $('<div class="check-imposible">ВНИМАНИЕ!Заказать ланч можно только через оператора!</div>').appendTo('.lunches-page-panail');
  $('<div class="check-imposible">Заказать Уно Набор можно только через оператора!</div>').appendTo('.sets-page-panail');
};
