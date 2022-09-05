import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["list", "indicator"];

  connect() {
    // console.log("----->");
  }

  update(event) {
    // console.log(event);
    for (list of this.listTargets) {
      list.classList.remove("active");
    }
    event.currentTarget.classList.add("active");
  }
}
