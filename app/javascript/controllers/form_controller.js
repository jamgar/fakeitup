import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["form", "search"]

  async submitForm() {
    this.formTarget.requestSubmit()
  }

  submitSearch() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.searchTarget.requestSubmit()
    }, 200)
  }
}
