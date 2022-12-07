import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="waitingroom-subscription"
export default class extends Controller {
  static values = { journeyId: Number, currentUserId: Number, currentUserStatus: Number}
  static targets = ["waitingUser", "button", "infos"]

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
          this.checkIfAllGood(data.json)
        }
      }
    )
  }

  changeStatus(json) {
    console.log("My current Status", this.currentUserStatusValue);
    console.log("Other member Status", json.status);
    if (json.status >= this.currentUserStatusValue) {
      const idSelector = `#status-${json.journeyMemberId}`
      const journeyMemberStatus = document.querySelector(idSelector)
      // journeyMemberStatus.innerText = "Validé"
      journeyMemberStatus.classList.remove("warning")
      journeyMemberStatus.classList.add("good")
    }
  }

  checkIfAllGood(json) {
    console.log(this.buttonTarget);
    if (json.status >= this.currentUserStatusValue && json.allGood) {
      this.buttonTarget.innerText = json.message
      this.buttonTarget.classList.remove("disabled")
      this.displayInfos(json)
    }
  }

  displayInfos(json) {
    if (this.hasInfosTarget) {
      const html = `
        <p>Vous partez à : ${json.infos.city}</p>
        <p>Vous partez du ${json.infos.startDate} au  ${json.infos.endDate}</p>
      `
      this.infosTarget.innerHTML = html
    }
  }

}
