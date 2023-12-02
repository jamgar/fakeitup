import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="list"
export default class extends Controller {
  setFields(e) {
    this.targetLabel = e.target
    this.targetType = document.getElementById(e.target.htmlFor)
    this.targetParent = document.getElementById(`${e.target.dataset.labelTarget}_parent`)
  }

  selectType(e) {
    const id = e.target.id.split("-")
    this.targetLabel.innerHTML = id.join(": ")
    this.targetType.value = id.pop() // to get the last item 
    this.targetParent.value = id[0] 
  }
}
