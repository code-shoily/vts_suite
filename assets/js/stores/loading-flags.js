import { types } from "mobx-state-tree";

let LoadingFlags = types
  .model("LoadingFlags", {
    id: types.identifier(),
    isLoggingIn: false,
    isUserInfoLoading: false
  })
  .actions(self => ({
    setIsLoggingIn(status) {
      self.isLoggingIn = status;
    },
    setUserInfoLoading(status) {
      self.isUserInfoLoading = status;
    }
  }));

export default LoadingFlags;
