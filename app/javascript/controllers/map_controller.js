import { Controller } from "@hotwired/stimulus"

// déclarer une classe de controller stimulus qui hérite Controller (behaviours de stimulus)
export default class extends Controller {

  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    console.log(this.apiKeyValue)
    mapboxgl.accessToken = this.apiKeyValue
    // on appelle mapx box avec l'access token
    // on crée une nouvelle instance de map
    // élément sur lequel le controller est montée (cf div de la view index)
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    console.log('Hello controller map box')
  }
  // méthode privée
  // on itère pour chaque market (un objet map box)
  // on récupère les markers.to_json de la view
  // voici les coordonées
  // et ajoute le à la map (= à la variable this.map )
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window) // Add this
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // Add this
        .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }
}
