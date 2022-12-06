import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="waitingroom-subscription"
export default class extends Controller {
  static values = { journeyId: Number, currentUserId: Number}
  static targets = ["waitingUser"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      {
        channel: "WaitingroomChannel",
        id: this.journeyIdValue
      },
      {
        connected: () => {
          console.log(`Subscribe to the waitingroom with the id ${this.journeyIdValue}.`);
        },
        received: data => {
          this.changeStatus(data.json)
        }
      }
    )
  }

  changeStatus(json) {
    console.log(json);
    const idSelector = `#status-${json.journeyMemberId}`
    console.log(idSelector);
    const journeyMemberStatus = document.querySelector(idSelector)
    console.log(journeyMemberStatus);
    journeyMemberStatus.innerText = "Validé"
    journeyMemberStatus.classList.remove("warning")
    journeyMemberStatus.classList.add("good")
  }
}
