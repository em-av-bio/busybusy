import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js";


// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startTime", "endTime" ]
  connect() {
    flatpickr(this.startTimeTarget, {mode: "range", minDate: "today", altFormat: "d-m-Y", altInput: true, locale: {...French, rangeSeparator: " au ",  firstDayOfWeek: 1}})
    // flatpickr(this.endTimeTarget)
  }
}
