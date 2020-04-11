import "../stylesheets/application.scss";

import React from "react";
import ReactDOM from "react-dom";

import Application from "../javascripts/application";

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Application />, document.getElementById("application"));
});
