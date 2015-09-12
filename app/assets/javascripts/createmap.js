var map_name, placemark, c_1, c_2, current_pos, result, users;
result = gon.places;
users = JSON.parse(gon.users);
//Отрисовка карты
map_name = "map";
  function init (ymaps) { 
      var map = new ymaps.Map(map_name, {
      center: [55.75, 37.67],
      zoom: 9
    });


//Заполнение карты точками
  for (var i = 0; i < result.length; i++) {
    c_1 = parseFloat(result[i].coordinates.split(",")[0] + "." + result[i].coordinates.split(",")[1])
    c_2 = parseFloat(result[i].coordinates.split(",")[2] + "." + result[i].coordinates.split(",")[3])
    placemark = new ymaps.Placemark([c_1, c_2], {
     balloonContentBody: result[i].title
    }, {
      preset: 'islands#redDotIcon'
    });
    placemark.link_id = result[i].id;
    map.geoObjects.add(placemark);
  }


//Открытие модального окна с добавлением точки

if ( users["user"] == $("#map").attr("data-user") ) {
  map.events.add('click', function (e) {
      current_pos = e.get('coords');
      $(".coordinates").val(current_pos.join().split('.').join(','));
      $('#form-modal').modal();
  });
}

//Открытие модального окна с содержимым
  map.geoObjects.events.add('click', function(e) {
    var mark = e.get('target');
    $.ajax({
      url: "/places/" + mark.link_id,
      type: "GET",
      dataType: 'script'
      });

    console.log(mark.link_id);
  });


}


