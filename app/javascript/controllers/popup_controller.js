import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup"
export default class extends Controller {
  connect() {
    console.log("pop!");
  }
  fire(event){

  }
}
