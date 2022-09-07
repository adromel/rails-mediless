import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="popup-to-search"
export default class extends Controller {
  static targets = ["modal", "container"];

  connect() {}

  open() {
    this.modalTarget.classList.remove("m-fadeOut");
    this.containerTarget.classList.add("m-fadeIn");
    this.containerTarget.classList.add("filter");
  }

  close() {
    this.containerTarget.classList.remove("filter");
    this.containerTarget.classList.remove("m-fadeIn");
    this.modalTarget.classList.add("m-fadeOut");
  }
}
