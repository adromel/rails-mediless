import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup-to-search"
export default class extends Controller {
  static targets = ["opener", "container"];

  open() {
    // Enlever le hidden du container
    console.log('je suis dans open')
    this.containerTarget.classList.remove("hidden")
  }

  close() {
    // ajoute le hidden au container
    this.containerTarget.classList.add("hidden")
    
  }

  connect() {
    console.log('je suis dans connect')
  }
}
