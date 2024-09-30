import StimulusController from "@app/controllers/homepage_controller.js";

describe("StimulusController", () => {
  it("renders the application description", () => {
    const element = document.createElement("p");
    element.classList.add("hidden");

    new StimulusController({ "scope": { "element": element } }).connect();

    expect(element.classList.contains("hidden")).to.eq(false);
  });
});
