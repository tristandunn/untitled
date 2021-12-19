import "@hotwired/turbo-rails";
import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers";

const context = require.context("../javascripts/controllers", true, /\.js$/);

Application.start().load(definitionsFromContext(context));
