var map = L.map('map').setView([-22.120482506031486, -51.40517021283939], 15);
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        minZoom: 1,
        attribution: '© OpenStreetMap'
        }).addTo(map);
        var LeafIcon = L.Icon.extend({
            options: {
                iconSize: [40, 40],
                shadowSize: [50, 64],
                iconAnchor: [22, 0],
                shadowAnchor: [4, 62],
                popupAnchor: [-3, -76]
            }
        })
        const icons = {
           home : new LeafIcon({iconUrl: 'assets/school.png'}),
           flag : new LeafIcon({iconUrl: 'assets/flag.png'}),
           pointer : new LeafIcon({iconUrl: 'assets/pointer.png'}) 
        }
        var markerHome = L.marker([-22.120482506031486, -51.40517021283939], {icon: icons.home}).addTo(map);
        let _pointA,
            _pointB,
            _routing,
            distancia = 0,
            time = 0,
            markerA = null,
            markerB = null;
        map.on('click', (e) => {
            if(!_pointA){
                _pointA = e.latlng
                markerA = L.marker(_pointA, {icon: icons.pointer}).addTo(map)
            }
            else if(!_pointB){
                _pointB = e.latlng
                markerB = L.marker(_pointB, {icon: icons.flag}).addTo(map)

                _routing = L.Routing.control({
                    waypoints: [
                        _pointA,
                        _pointB
                    ],
                    createMaker: function() { return null; }
                })
                .on('routesfound', (e) =>{
                    let summary = e.routes[0].summary
                    distancia = summary.totalDistance / 1000
                    distancia = distancia > 1 ? distancia.toFixed(2) + ' km' : Math.round(distancia * 1000) + ' metros'
                    time = Math.round(summary.totalTime / 60)
                    markerB.bindPopup(`
                       Destino final <br/>
                       <strong> ${distancia} </strong> e ${time} minutos
                    `).openPopup();
                })
                .addTo(map);
            }
            else{
                _pointA = e.latlng;
                map.removeLayer(markerA);
                map.removeLayer(markerB);
                if(_routing){
                    map.removeControl(_routing);
                }
                distancia = 0,
                time = 0,
                _pointB = null;

                markerA = L.marker(_pointA, {icon: icons.pointer}).addTo(map)
            }
        })