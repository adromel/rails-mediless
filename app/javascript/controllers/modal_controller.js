import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup-to-search"
export default class extends Controller {
  static targets = ["opener", "closer"];

  open() {
    this.openerTarget.classList.remove("hidden")
  }

  close() {
    this.closerTarget.classList.add("hidden")
  }

  connect() {

  }
}
