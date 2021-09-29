import I18n from "../i18n";
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  /**
   * Update the website description.
   *
   * @return {void}
   */
  connect() {
    this.element.innerText = I18n.t("pages.stimulus.description");
  }
}
