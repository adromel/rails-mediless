import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="button-up"
export default class extends Controller {
  static targets = ["icon"];

  scrollUp(event) {
    console.log(event);
    window.scrollTo(0, 0);
  }
}
