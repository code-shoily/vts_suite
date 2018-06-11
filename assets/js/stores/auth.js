import { types, flow, getParent } from "mobx-state-tree";
import { LOGIN_URL, LOCAL_STORAGE_KEY } from "../config/constants";
import axios from "axios";
import LoadingFlags from "./loading-flags";

const AuthStore = types
  .model("Auth", {
    loadingFlags: types.reference(LoadingFlags),
    errors: types.optional(types.array(types.string), []),
    key: types.maybe(types.string),
    username: types.maybe(types.string)
  })
  .actions(self => {
    let login = flow(function*(username, password, callback, errback) {
      self.loadingFlags.setIsLoggingIn(true);
      self.errors = [];
      try {
        let {
          data: { key, id, firstName, lastName, email }
        } = yield axios.post(LOGIN_URL, {
          username,
          password
        });
        self.setCredentials(username, key);
        // CREATE THE USER
        getParent(self).setUser(
          UserStore.create({
            firstName: firstName,
            lastName: lastName,
            email: email,
            id: id
          })
        );
        // END CREATING THE USER

        self.callback && callback();
      } catch (error) {
        let errorResponse = error.response.data;
        if ("message" in errorResponse) {
          self.errors = errorResponse.message;
        } else {
          self.errors = ["Login Error"];
        }
      } finally {
        self.loadingFlags.setIsLoggingIn(false);
      }
    });

    return {
      login,
      setCredentials(username, key) {
        self.key = key;
        self.username = username;

        localStorage.setItem(
          LOCAL_STORAGE_KEY,
          JSON.stringify({ username: self.username, key: self.key })
        );
      },
      clearCredentials() {
        self.key = null;
        self.username = null;
        self.errors = [];
        localStorage.removeItem(LOCAL_STORAGE_KEY);
      }
    };
  })
  .views(self => {
    return {
      isLoggedIn() {
        return self.username && self.key;
      }
    };
  });

export function loadFromStorage(loadingFlags) {
  const maybeAuthKey = localStorage.getItem(LOCAL_STORAGE_KEY);
  const authJSON = maybeAuthKey
    ? JSON.parse(maybeAuthKey)
    : { key: null, username: null, loadingFlags: loadingFlags };
  return AuthStore.create({ ...authJSON, loadingFlags });
}

export default AuthStore;
