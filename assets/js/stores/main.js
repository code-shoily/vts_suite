import { types, flow } from "mobx-state-tree";
import axios from "axios";

import { headerFunc, USER_URL } from "../config/constants";
import LoadingFlags from "./loading-flags";
import UIStore from "./ui";
import AuthStore from "./auth";
import UserStore from "./user";
import GroupList from "./group";
import Vehicle from "./vehicle";
import Location from "./location";

const MainStore = types
  .model("Main", {
    speedLimit: 20,
    loadingFlags: types.reference(LoadingFlags),
    ui: types.optional(UIStore, {}),
    auth: types.maybe(AuthStore),
    user: types.maybe(types.reference(UserStore)),
    groupList: types.optional(GroupList, { groups: [] }),
    vehicleList: types.optional(Vehicle, { vehicles: {} }),
    locationList: types.optional(Location, { locations: {} })
  })
  .actions(self => {
    return {
      setSpeedLimit(speed) {
        self.speedLimit = speed;
      },
      setUser(user) {
        self.user = user;
      },
      reset() {
        self.locationList.reset();
        self.vehicleList.reset();
        self.groupList.reset();
        self.user && self.user.reset();
        self.auth.clearCredentials();
      }
    };
  });

export default MainStore;
