import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-input"
export default class extends Controller {
  static targets = ["input", "search"]

  connect() {
    console.log("------>")
    // console.log(this.inputTarget)
    // console.log(this.searchTarget)

  }
  research(event) {
    console.log(event)
    fetch(`/search?query=${this.inputTarget.value}`)
    .then(response => response.text())
    .then((htmlResult) => {
      this.listTarget.innerHTML = htmlResult
    })

  }
  }
}
