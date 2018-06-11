import { types, flow, getParent, getRoot } from "mobx-state-tree";
import { LOCATION_URL, headerFunc, FLAT_COLORS } from "../config/constants";

import axios from "axios";
import moment from "moment";

export const Location = types
  .model("Location", {
    id: types.identifier(types.string),
    locationHash: types.string,
    vehicle: types.number,
    actualTime: types.Date,
    latestTime: types.Date,
    lat: types.number,
    lng: types.number,
    speed: types.number, //FIXME
    gpstat: types.string,
    courseval: types.number,
    landmark: types.string,
    engine: types.maybe(types.string)
  })
  .actions(self => {
    return {
      updateTime({ actualTime, latestTime, gpstat }) {
        self.actualTime = actualTime;
        self.latestTime = latestTime;
        self.gpstat = gpstat;
      }
    };
  })
  .views(self => {
    return {
      get accuracy() {
        return self.gpstat === "F" ? 1 : -1;
      },
      get vehicleObject() {
        let vehicleList = getRoot(self).vehicleList;
        return vehicleList.vehicleByID(self.vehicle);
      },
      get formattedTime() {
        return moment(self.latestTime).format("D/M/Y hh:mm a");
      },
      get timeSince() {
        return moment(self.latestTime).fromNow();
      },
      get colorCSS() {
        let speed = self.speed;
        if (0 <= speed && speed < 5) {
          return {
            background: FLAT_COLORS.belizeHole,
            color: FLAT_COLORS.clouds
          };
        }
        if (5 <= speed && speed < 30) {
          return {
            background: FLAT_COLORS.nephritis,
            color: FLAT_COLORS.clouds
          };
        }
        if (30 <= speed && speed < 60) {
          return {
            background: FLAT_COLORS.sunFlower,
            color: FLAT_COLORS.clouds
          };
        }
        if (60 <= speed && speed < 90) {
          return {
            background: FLAT_COLORS.midnightBlue,
            color: FLAT_COLORS.clouds
          };
        }
        if (90 <= speed) {
          return {
            background: FLAT_COLORS.pomegranate,
            color: FLAT_COLORS.clouds
          };
        }
      },
      get getIcon() {
        let speed = self.speed;
        if (0 <= speed && speed < 5) {
          return "http://maps.google.com/mapfiles/ms/icons/blue-dot.png";
        }
        if (5 <= speed && speed < 30) {
          return "http://maps.google.com/mapfiles/ms/icons/green-dot.png";
        }
        if (30 <= speed && speed < 60) {
          return "http://maps.google.com/mapfiles/ms/icons/yellow-dot.png";
        }
        if (60 <= speed && speed < 90) {
          return "http://maps.google.com/mapfiles/ms/icons/blue-dot.png";
        }
        if (90 <= speed) {
          return "http://maps.google.com/mapfiles/ms/icons/red-dot.png";
        }
      }
    };
  });

const LocationList = types
  .model("LocationList", {
    locationListLoading: false,
    locations: types.map(Location)
  })
  .actions(self => {
    const fetchLocations = flow(function*() {
      self.locationListLoading = true;
      let groupID = getParent(self).groupList.selectedGroup.id;
      let key = getParent(self).auth.key;
      let vehicleList = getParent(self).vehicleList;
      try {
        let { data } = yield axios.get(
          `${LOCATION_URL}?group=${groupID}`,
          headerFunc(key)
        );
        data.forEach(d => {
          let vehicle = vehicleList.vehicleByID(d.vehicle);

          if (d.id in self.locations) {
            // DO NOTHING
          } else if (
            vehicle.location &&
            vehicle.location.locationHash === d.locationHash
          ) {
            vehicle.location.updateTime({
              actualTime: moment(d.actualTime).toDate(),
              latestTime: moment(d.latestTime).toDate(),
              gpstat: d.gpstat
            });
          } else {
            let location = Location.create({
              id: d.id,
              locationHash: d.locationHash,
              vehicle: d.vehicle,
              actualTime: moment(d.actualTime).toDate(),
              latestTime: moment(d.latestTime).toDate(),
              lat: d.lat,
              lng: d.lng,
              speed: parseInt(d.speed, 10),
              gpstat: d.gpstat,
              courseval: d.courseval,
              landmark: d.landmark,
              engine: d.engine
            });
            vehicle.setLocation(location);
            self.locations.put(location);
          }
        });
        self.locationListLoading = false;
      } catch (error) {
        // ?
      }
    });
    return {
      reset() {
        self.locations = {};
      },
      fetchLocations
    };
  })
  .views(self => {
    return {
      get sortedByLatestTime() {
        return self.locations.values().sort((a, b) => {
          if (a.latestTime < b.latestTime) {
            return 1;
          } else if (a.latestTime > b.latestTime) {
            return -1;
          } else {
            return 0;
          }
        });
      },
      locationsForVehicle(id) {
        return self.locations
          .values()
          .filter(location => location.vehicle === id)
          .sort((a, b) => {
            if (a.latestTime < b.latestTime) {
              return 1;
            } else if (a.latestTime > b.latestTime) {
              return -1;
            } else {
              return 0;
            }
          });
      }
    };
  });

export default LocationList;
