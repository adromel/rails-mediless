import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["list", "indicator"];

  connect() {
    console.log("----->");
  }

  update(event) {
    event.preventDefault();
    this.listTargets.forEach((list) => {
      list.classList.remove("active");
    });
    event.currentTarget.classList.add("active");

    console.log(this.listTargets.indexOf(event.target.parentNode));

    this.indicatorTarget.style.left = `${
      this.listTargets.indexOf(event.target.parentNode) * 69
    }px`;

    // nav_indicator.style.left = `calc(${i * 120 + 10}px - 158px)`;
  }
}
