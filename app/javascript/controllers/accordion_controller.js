import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accordion"
export default class extends Controller {
  targets = ["accordion"]

  connect() {
    console.log("Hello");
    this.accordionTarget.collapse();
  }
}
