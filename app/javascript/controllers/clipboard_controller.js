import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = ["source", "tooltip"]

  copy(event) {
    event.preventDefault()
    this.tooltipTarget.classList.remove("hidden")
    setTimeout(() => {
      this.dimiss()
    }, 3000)
    navigator.clipboard.writeText(this.sourceTarget.innerHTML)
  }

  dimiss() {
    this.tooltipTarget.classList.add("hidden")
  }
}
