import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Matchup controller conectado!")
  }

  hideAlly(event){
    this.element.querySelectorAll("[data-role]").forEach(element => {
      element.classList.remove("d-none")
      if (element.dataset.role == event.target.value) {
        element.classList.add("d-none")
      }
    });
  }
}