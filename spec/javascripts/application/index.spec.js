import React from "react";
import Application from "application";
import I18n from "i18n";
import { render } from "react-dom";
import { act } from "react-dom/test-utils";

describe("Application", () => {
  it("renders the application description", () => {
    act(() => {
      render(<Application />, container);
    });

    expect(container.textContent).to.eq(I18n.t("description"));
  });
});
