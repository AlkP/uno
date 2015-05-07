(function($){
  $(function() {
    var container = $('#container');
    var city = container.find( '[name="sendform[town]"]' );
    var street = container.find( '[name="sendform[street]"]' );

    // Подключение автодополнения улиц
    street.kladr({
      token: '538ed8b8fca916a1464d412e',
      key: 'aafb8890ba3789e425cf1422ec0f2943e141dd9c',
      type: $.kladr.type.street,
      parentType: $.kladr.type.city,
      parentId: city.val()
    });

    city.change(function(){
      // Изменение родительского объекта для автодополнения улиц
      street.kladr('parentId', city.val());
    });
  });
})(jQuery);