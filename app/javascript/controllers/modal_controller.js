import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="popup-to-search"
export default class extends Controller {
  static targets = ["opener", "closer"];

  connect() {}

  open() {
    console.log("Click");
    this.openerTarget.classList.remove("hidden");
  }

  close() {
    this.closerTarget.classList.add("hidden");
  }
}
