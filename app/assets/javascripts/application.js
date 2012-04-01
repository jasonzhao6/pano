// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function addOne(lat, lng, heading, pitch, zoom) {
  lat = parseFloat(lat);
  lng = parseFloat(lng);
  heading = parseFloat(heading);
  pitch = parseFloat(pitch);
  zoom = parseFloat(zoom);
  var latLng = new google.maps.LatLng(lat, lng);
  var mapOptions = {
    center: latLng,
    zoom: 5,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(
    document.getElementById('map'), mapOptions
  );
  var panoramaOptions = {
    position: latLng,
    pov: {
      heading: heading,
      pitch: pitch,
      zoom: zoom
    }
  };
  var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano'), panoramaOptions);
  map.setStreetView(panorama);
}
