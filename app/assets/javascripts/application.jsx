import I18n from "./i18n";
import React from "react";

/**
 * Render the application.
 *
 * @returns {Element} The rendered application.
 */
export default function Application() {
  return (
    <p>{I18n.t("description")}</p>
  );
}
