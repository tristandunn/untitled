export const mochaHooks = {
  afterEach() {
    sinon.restore();
  }
};
