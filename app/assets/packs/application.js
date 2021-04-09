import "../stylesheets/application.scss";
import "@hotwired/turbo-rails";
import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

const context = require.context("../javascripts/controllers", true, /\.js$/);

Application.start().load(definitionsFromContext(context));
