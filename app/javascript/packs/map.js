import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
  if (mapElement) { // don't try to build a map if there's no div#map to inject in
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 15,
    center: { lat:-22.970728, lng:-42.024061 }
  });
  const markers = JSON.parse(mapElement.dataset.markers);
  // map.addMarkers(markers);


markers.forEach((marker)=>{
   var infowindow = new google.maps.InfoWindow({
    content: marker.infoWindow
  });

  var mapMarker = new google.maps.Marker({
    position: { lat: marker.lat, lng: marker.lng },
    map: map,
    icon: "https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png",
    title: marker.name
  });
    mapMarker.setMap(map);
  mapMarker.addListener('click', function() {
    infowindow.open(map, mapMarker);
  });


})

}

