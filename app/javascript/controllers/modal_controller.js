import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="popup-to-search"
export default class extends Controller {
  static targets = ["modal", "container"];

  connect() {}

  open() {
    this.modalTarget.classList.remove("hidden");
    this.containerTarget.classList.add("filter");
  }

  close() {
    this.containerTarget.classList.remove("filter");
    this.modalTarget.classList.add("hidden");
  }
}
