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
    if (this.infosTarget && json.allGood) {
      const html = `
      <h2 class="text-center my-4">Les votes ont parlé !</h2>
      <div class="sumary-location shadow-md bg-white w-full gap-4 rounded-lg overflow-hidden">
      <div  class="summary-location__location bg-no-repeat bg-cover"
            style="background-image: url('${json.infos.city_url}');"
            >
        <div class="w-full h-52 left-0 top-0 flex items-center justify-center">
          <div class="bg-dark-alpha px-4 rounded text-white text-bold text-2xl">${json.infos.city}</div>
        </div>
      </div>
      <div class="summary-location__date flex items-center justify-center gap-2 p-2">
        <span class="text-great-blue-300">du</span>
        <span class="text-great-blue-600 font-bold">${json.infos.startDate}</span>
        <span class="text-great-blue-300">au</span>
        <span class="text-great-blue-600 font-bold">${json.infos.endDate}</span>
      </div>
    </div>`
      this.infosTarget.innerHTML = html
    }
  }

}
