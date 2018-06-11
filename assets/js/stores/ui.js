import { types } from "mobx-state-tree";

const UIStore = types
  .model("UIStore", {
    sideBarCollapsed: true
  })
  .actions(self => ({
    toggleSideBarCollapsed() {
      self.sideBarCollapsed = !self.sideBarCollapsed;
    }
  }));

export default UIStore;
