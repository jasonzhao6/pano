// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require_tree .

function addDestiantion(i, destination) {
  i++;
  var lat = parseFloat(destination.latitude);
  var lng = parseFloat(destination.longitude);
  var heading = parseFloat(destination.heading);
  var pitch = parseFloat(destination.pitch);
  var zoom = parseInt(destination.zoom);
  
  $('#heading' + i).text(destination.state + ' (' + destination.latitude + ', ' + destination.longitude + ')');
  
  var latLng = new google.maps.LatLng(lat, lng);
  var mapOptions = {
    center: latLng,
    disableDefaultUI: true,
    zoom: 7,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    scrollwheel: false,
    streetViewControl: true,
    zoomControl: true
  };
  var panoramaOptions = {
    addressControl: false,
    clickToGo: false,
    imageDateControl: false,
    linksControl: false,
    panControl: false,
    position: latLng,
    pov: {
      heading: heading,
      pitch: pitch,
      zoom: zoom
    },
    scrollwheel: false,
    zoomControl: true
  };
  var map = new google.maps.Map(document.getElementById('map' + i), mapOptions);
  var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano' + i), panoramaOptions);
  map.setStreetView(panorama);
}
