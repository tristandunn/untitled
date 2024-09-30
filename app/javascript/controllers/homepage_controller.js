import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  /**
   * Update the website description.
   *
   * @return {void}
   */
  connect() {
    this.element.classList.remove("hidden");
  }
}
