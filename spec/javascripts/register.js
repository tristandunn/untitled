import { register } from "node:module";
import { pathToFileURL } from "node:url";

register("./spec/javascripts/helpers/import-resolver.js", pathToFileURL("./"));
