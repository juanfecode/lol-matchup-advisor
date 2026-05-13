import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["result", "button"]

  showLoading(event) {
    if (this.hasButtonTarget) {
      this.buttonTarget.disabled = true
      this.buttonTarget.value = "Searching..."
      this.buttonTarget.classList.add("opacity-60", "cursor-not-allowed")
    }

    if (this.hasResultTarget) {
      this.resultTarget.innerHTML = `
        <div class="bg-[#151f34] p-12 text-center">
          <div class="inline-block animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-[#eaca8b] mb-6"></div>
          <p class="text-[#eaca8b] font-bold text-lg mb-2">Searching champions...</p>
          <p class="text-gray-400 text-sm">Vector search + Claude analysis — usually 10-15 seconds</p>
        </div>
      `
      this.resultTarget.scrollIntoView({ behavior: "smooth", block: "start" })
    }
  }
}
