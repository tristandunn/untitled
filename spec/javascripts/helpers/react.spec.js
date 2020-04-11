beforeEach(() => {
  global.container = document.createElement("div");

  document.body.appendChild(global.container);
});

afterEach(() => {
  global.container.remove();
  global.container = null;
});
