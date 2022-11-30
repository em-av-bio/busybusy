import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sortable"
export default class extends Controller {
  static targets: ["card"];
  static values: {ranking: integer};
  connect() {
    console.log("Je suis dans Stimulus")
  }

  updateRankings(event) {
    this.cardTargets.forEach(card => console.log(rankingValue))
  }
}
