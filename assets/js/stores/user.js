import { types } from "mobx-state-tree";

const User = types
  .model("User", {
    id: types.identifier(types.number),
    isAdmin: false,
    firstName: types.maybe(types.string),
    lastName: types.maybe(types.string),
    email: types.maybe(types.string)
  })
  .actions(self => ({
    reset() {
      self.firstName = null;
      self.lastName = null;
      self.email = null;
    },
    setAdminMode(mode) {
      self.isAdmin = mode;
    }
  }))
  .views(self => ({
    initials() {
      return (
        ((self.firstName && self.firstName[0]) || "") +
        ((self.lastName && self.lastName[0]) || "")
      );
    }
  }));

export default User;
