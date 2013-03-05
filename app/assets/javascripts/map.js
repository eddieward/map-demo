// map.js

var currentFocus = false;

function focusPoint(id) {
    if (currentFocus) {
        $("#sidebar-item-" + currentFocus).removeClass("current");
    }
    $("#sidebar-item-" + id).addClass("current");
    currentFocus = id;
}

$(document).ready(function () {


    var infowindow;

    $.getJSON("/places", function (json) {
        places = json;
        for (var i = 0; i < places.length; i++) {
            addMarkers(places[i], i);
        }
    });

    var options = {
        zoom: 13,
        center: new google.maps.LatLng(43.655826,-79.383116),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(document.getElementById('map'), options);

    function addMarkers(place, i) {
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(place.latitude, place.longitude),
            map: map,
            title: place.title
        });

        (function (marker) {

            var content =

            "<div id='info'><h2>" +  place.title + "</h2>" + place.description + "</div>";

            google.maps.event.addListener(marker, 'click', function () {

                focusPoint(place.id);

                if (!infowindow) {
                    infowindow = new google.maps.InfoWindow();
                }
                infowindow.setContent(content);
                infowindow.open(map, marker);
            });

            $("#sidebar-item-" + place.id).click(function() {
                if (!infowindow) {
                    infowindow = new google.maps.InfoWindow();
                }
                infowindow.setContent(content);
                infowindow.open(map, marker);
            });

        })(marker);
    }
});