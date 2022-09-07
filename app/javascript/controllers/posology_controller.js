import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="posology"
export default class extends Controller {
  static targets = ["text", "link"];
  static values = { detailsOpen: Boolean };
  connect() {
    // console.log("------>");
    // console.log(this.textTarget);
  }

  toggle(event) {
    event.preventDefault();
    // console.log(event);
    this.detailsOpenValue = !this.detailsOpenValue;
    this.textTarget.classList.toggle("set-posology");
    if (this.detailsOpenValue === true) {
      this.linkTarget.innerText = "Réduire";
    } else {
      this.linkTarget.innerText = "Voir plus";
    }
    // this.textTarget.classList.add("set-posology");
  }
}
