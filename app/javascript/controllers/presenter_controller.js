import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="presenter"
export default class extends Controller {
  static values = {
    json: Array
  }
  static targets = ["show"]
  connect() {
    this.showTarget.innerHTML = JSON.stringify(this.jsonValue, null, '  ')
  }
}
