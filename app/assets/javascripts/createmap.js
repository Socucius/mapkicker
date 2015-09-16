


//Отрисовка карты
var map_name = "map";

function init (ymaps) { 

  var map = new ymaps.Map(map_name, {
    center: [55.75, 37.67],
    zoom: 9
  });

  var placemark, c_1, c_2, current_pos, result, users;
  result = gon.places;
  users = JSON.parse(gon.users);



//Заполнение карты точками
  for (var i = 0; i < result.length; i++) {
    c_1 = parseFloat(result[i].coordinates.split(",")[0] + "." + result[i].coordinates.split(",")[1])
    c_2 = parseFloat(result[i].coordinates.split(",")[2] + "." + result[i].coordinates.split(",")[3])
    placemark = new ymaps.Placemark([c_1, c_2], {
     balloonContentBody: '<h4>' + result[i].title + '</h4>'
    }, {
      preset: 'islands#redDotIcon'
    });
    placemark.link_id = result[i].id;
    placemark.result_id = i;
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


var get_place_data = function(link_id){
  $.ajax({
    url: "/places/" + link_id,
    type: "GET",
    dataType: 'html',
    success: function(data){
      return data;
    }
    });
}


//Открытие модального окна с содержимым
  map.geoObjects.events.add('click', function(e) {
    var mark = e.get('target');
    $.ajax({
      url: "/places/" + mark.link_id,
      type: "GET",
      dataType: 'html',
      success: function(data){
        $('#place-content').html(data);
        $('#place-modal').modal();
      }
      });
  });

//Превью
  map.geoObjects.events.add('hover', function(e) {
    var coords = e.get('coords');
    coords[0] += 0.01; coords[1] += 0.01;
    var result_id = e.get('target').result_id;
    map.balloon.open(coords, {
      contentBody: '<h4>' + result[result_id].title + '</h4>'
    }); 

  });

}

