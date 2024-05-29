import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="timepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element
      , {
        enableTime: true,
        noCalendar: true,
        dateFormat: "H:i",
      }
    )
  }
}
