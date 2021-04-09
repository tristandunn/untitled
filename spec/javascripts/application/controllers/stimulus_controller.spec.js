import I18n from "i18n";
import StimulusController from "controllers/stimulus_controller";

describe("StimulusController", () => {
  it("renders the application description", () => {
    const element = document.createElement("p");
    element.appendChild(document.createTextNode(""));

    (new StimulusController({ scope: { element: element } })).connect();

    expect(element.innerText).to.eq(I18n.t("pages.stimulus.description"));
  });
});
