import { unmountComponentAtNode } from "react-dom";

beforeEach(() => {
  global.container = document.createElement("div");

  document.body.appendChild(global.container);
});

afterEach(() => {
  unmountComponentAtNode(global.container);

  global.container.remove();
  global.container = null;
});
