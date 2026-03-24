import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { images: Object }

  connect() {
    console.log("Matchup controller conectado!")
  }

  hideAlly(event) {
    const selectedRole = event.target.value
    this.element.querySelectorAll("div[data-role]").forEach(element => {
      element.classList.remove("hidden")
      if (element.dataset.role === selectedRole) {
        element.classList.add("hidden")
      }
    })
  }

  openSelect(event) {
    const container = event.currentTarget.closest(".champion-row")
    const select = container.querySelector("select")
    if (select) {
      select.showPicker()
    }
  }

  updatePortrait(event) {
    const select = event.target
    const championName = select.value
    const container = select.closest(".champion-row")
    const portrait = container.querySelector(".champion-portrait")
    const placeholder = container.querySelector(".champion-placeholder")
    const nameLabel = container.querySelector(".champion-name-label")

    if (championName && this.imagesValue[championName]) {
      const imgUrl = this.imagesValue[championName]

      if (portrait) {
        portrait.src = imgUrl
        portrait.classList.remove("hidden", "opacity-0", "scale-75")
        portrait.classList.add("opacity-100", "scale-100")
      }
      if (placeholder) {
        placeholder.classList.add("hidden")
      }
      if (nameLabel) {
        nameLabel.textContent = championName.toUpperCase()
      }
    } else {
      if (portrait) {
        portrait.classList.add("hidden", "opacity-0", "scale-75")
        portrait.classList.remove("opacity-100", "scale-100")
      }
      if (placeholder) {
        placeholder.classList.remove("hidden")
      }
      if (nameLabel) {
        nameLabel.textContent = ""
      }
    }
  }
}
