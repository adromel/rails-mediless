import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="button-up"
export default class extends Controller {
  static targets = ["icon"];

  connect() {
    console.log("----->");
    console.log(this.iconTarget.value);
  }

  scrollUp(event) {
    console.log(event);
      top: 0,
      left: 0,
      behavior: "smooth"
  }
}
