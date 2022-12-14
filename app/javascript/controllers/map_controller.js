import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      center: [2.213749, 46.227638],
      style: "mapbox://styles/mapbox/streets-v10",
    })
    const nav = new mapboxgl.NavigationControl();
    this.map.addControl(nav, 'top-left');
    this.map.scrollZoom.disable();
    this.#addMarkersToMap();
    this.#fitMapToMarkers();
  }
    #addMarkersToMap() {
      this.markersValue.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.info_window)
        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(this.map)
      });
    }
    #fitMapToMarkers() {
      const bounds = new mapboxgl.LngLatBounds()
      this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.map.fitBounds(bounds, { padding: 30, maxZoom: 15, duration: 0 })
    }

}
