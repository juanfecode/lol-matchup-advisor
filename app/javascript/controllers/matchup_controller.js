import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Matchup controller conectado!")
  }

  hideAlly(event){
    const selectedRole = event.target.value
    this.element.querySelectorAll("div[data-role]").forEach(element => {
      element.classList.remove("hidden", "opacity-50", "pointer-events-none")
      if (element.dataset.role === selectedRole) {
        element.classList.add("hidden")
      }
    })
  }
}
