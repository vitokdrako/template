<?php echo $header; ?>

  <div class="block_breadcrumb template_contact">
    <h1><?php echo $heading_title; ?></h1>
    <ul class="breadcrumb">
    <?php $count = count($breadcrumbs); foreach ($breadcrumbs as $i=>$breadcrumb) { ?>
      <?php if ($i+1 == $count) { ?>
        <li><span><?php echo $breadcrumb['text']; ?></span></li>
      <?php } else { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><i class="fa fa-angle-right" aria-hidden="true"></i></li>
      <?php } ?>
    <?php } ?>
    </ul>
  </div>
  <div class="container">
  <div id="google_map"></div>    
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <?php echo $content_top; ?>
      <div class="row">
        <div class="col-sm-12">
          <div class="content">
            <?php echo $description; ?>
          </div>
        </div>
      </div>
      <div class="block_contacts">
        <div class="row">
          <div class="col-sm-4">
            <div class="item_contacts">
              <div class="icon_contacts"><i class="fa fa-map-o" aria-hidden="true"></i></div>
              <div class="title">Адрес</div>
              <div class="text">вул. Будіндустрії, 4, Київ</div>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="item_contacts">
              <div class="icon_contacts"><i class="fa fa-phone" aria-hidden="true"></i></div>
              <div class="title">Телефон</div>
              <div class="text"><a href="tel:+380971230993">+380971230993</a></div>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="item_contacts">
              <div class="icon_contacts"><i class="fa fa-envelope-o" aria-hidden="true"></i></div>
              <div class="title">Почта</div>
              <div class="text"><a href="mailto:rfarfordecor@gmail.com">rfarfordecor@gmail.com</a></div>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12">
          <?php echo $sobfeedback_id46; ?>
        </div>
      </div>
      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCikwkaWZpugon1q5WQr-c6Kxb75dxw1z4"></script>
<script>
  jQuery( document ).ready(function() {
  var map;
  // Функция initMap которая отрисует карту на странице
 

  // В переменной map создаем объект карты GoogleMaps и вешаем эту переменную на <div id="map"></div>
  map = new google.maps.Map(document.getElementById('google_map'), {
    // При создании объекта карты необходимо указать его свойства
    // center - определяем точку на которой карта будет центрироваться
    center: {lat: 50.406899511687634, lng: 30.54952171198851},
    // zoom - определяет масштаб. 0 - видно всю платнеу. 18 - видно дома и улицы города.
    zoom: 15,

    // Добавляем свои стили для отображения карты
    styles: [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]
  });

  // Создаем маркер на карте
  var marker = new google.maps.Marker({

    // Определяем позицию маркера
      position: {lat: 50.405552236576234, lng: 30.546379418554846},

      // Указываем на какой карте он должен появится. (На странице ведь может быть больше одной карты)
      map: map,

      // Пишем название маркера - появится если навести на него курсор и немного подождать
      title: 'Title',

      // Укажем свою иконку для маркера
      icon: 'https://www.farforrent.com.ua/image/catalog/image/marker_icon_143091.png'
  });

  // Создаем наполнение для информационного окна
  var contentString = '<div id="content">'+
        '<div id="siteNotice">'+
        '</div>'+
        '<h1 id="firstHeading" class="firstHeading">FarforDecor</h1>'+
        '<div id="bodyContent">'+
        '<p>У нас вы можете найти разнообразный реквизит, мебель, текстиль, посуду, чтобы обеспечить декор вашего мероприятия или съемки.</p>'+
        '<p><b>Веб-сайт:</b> <a href="http://www.farforrent.com.ua" target="_blank">farforrent.com.ua</a>'+
        '</p>'+
        '</div>'+
        '</div>';

  // Создаем информационное окно
  var infowindow = new google.maps.InfoWindow({
     content: contentString,
     maxWidth: 400
  });

  // Создаем прослушивание, по клику на маркер - открыть инфо-окно infowindow
  marker.addListener('click', function() {
    infowindow.open(map, marker);
  });
});
</script>
<?php echo $footer; ?>