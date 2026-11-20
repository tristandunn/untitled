import { registerHooks } from "node:module";
import { resolve } from "./helpers/import-resolver.js";

registerHooks({ resolve });
