import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="list"
export default class extends Controller {
  openList(e) {
    this.targetLabel = e.target
    this.targetName = document.getElementById(e.target.htmlFor)
    // this.targetElement.classList.remove("hidden") 
  }

  selectType(e) {
    const id = e.target.id
    this.targetLabel.innerHTML = id
    this.targetName.value = id
  }

  closeList() {
    // this.targetElement.classList.add("hidden") 
  }

  get targetElement() {
    return document.getElementById("types-list")
  }
}
