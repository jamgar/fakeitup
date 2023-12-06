import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="presenter"
export default class extends Controller {
  static values = {
    json: Array,
    csv: String
  }
  static targets = ["show"]
  connect() {
    this.showJson()
  }

  showJson() {
    this.removeActiveClass()
    this.targetTabs[0].classList.add("tab-active")
    this.showTarget.innerHTML = JSON.stringify(this.jsonValue, null, '  ')
  }

  showCsv() {
    this.removeActiveClass()
    this.targetTabs[1].classList.add("tab-active")
    this.showTarget.innerHTML = this.csvValue;
  }

  get targetTabs() {
    return document.querySelectorAll('.tab')
  }

  removeActiveClass() {
    this.targetTabs.forEach((tab) => {
      tab.classList.remove("tab-active") 
    })
  }
}
