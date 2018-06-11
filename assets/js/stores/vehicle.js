import { flow, types, getParent, getRoot } from "mobx-state-tree";
import axios from "axios";
import { Location } from "./location";

import { VEHICLE_URL, headerFunc } from "../config/constants";

const Vehicle = types
  .model("Vehicle", {
    id: types.identifier(types.number),
    selected: true,
    expanded: false,
    focused: false,
    licensePlate: types.string,
    vehicleType: types.string,
    tag: types.string,
    model: types.maybe(types.string),
    color: types.maybe(types.string),
    device: types.maybe(types.string),
    location: types.maybe(types.reference(Location))
  })
  .actions(self => ({
    setLocation(location) {
      self.location = location;
    },
    toggleSelected() {
      self.selected = !self.selected;
    },
    toggleExpanded() {
      self.expanded = !self.expanded;
    },
    setFocused() {
      getRoot(self).vehicleList.focusVehicle(self.id);
    },
    setSelected(b) {
      self.selected = b;
    }
  }))
  .views(self => {
    return {
      get latlngStyle() {
        return self.location
          ? {
              lat: self.location.lat,
              lng: self.location.lng
            }
          : { lat: 0, lng: 0 };
      },
      allLocations() {
        return getParent(self).locationList.locationsForVehicle(self.id);
      }
    };
  });

const VehicleList = types
  .model("VehicleList", {
    tracking: 0,
    vehicleListLoading: true,
    vehicles: types.map(Vehicle),
    selectedVehicle: types.maybe(types.reference(Vehicle))
  })
  .actions(self => {
    let fetchVehicleList = flow(function*() {
      let groupID = getParent(self).groupList.selectedGroup.id;
      let key = getParent(self).auth.key;
      let { data } = yield axios.get(
        `${VEHICLE_URL}?group=${groupID}`,
        headerFunc(key)
      );
      data.forEach((d, idx) => {
        self.vehicles.put({
          id: parseInt(d.id, 10),
          licensePlate: d.licensePlate,
          vehicleType: d.vehicleType,
          tag: d.tag,
          focused: false,
          model: d.model,
          color: d.color,
          device: d.connectedDevice
        });
      });
      if (self.vehicles.values().length > 0) {
        self.selectedVehicle = self.vehicles.values()[0];
        self.selectedVehicle.setFocused();
      }
      //
      getParent(self).locationList.fetchLocations();
      self.tracking = setInterval(
        () => getParent(self).locationList.fetchLocations(),
        30000
      );
      //
    });
    return {
      reset() {
        self.vehicles = {};
        self.selectedVehicle = null;
        clearInterval(self.tracking);
        self.tracking = 0;
      },
      selectAll() {
        self.vehicles.values().forEach(v => v.setSelected(true));
      },
      unselectAll() {
        self.vehicles.values().forEach(v => v.setSelected(false));
      },
      setSelectedVehicle(vehicle) {
        self.selectedVehicle = vehicle;
      },
      focusVehicle(id) {
        self.vehicles.values().forEach(v => {
          if (v.id === id) {
            v.focused = true;
          } else {
            v.focused = false;
          }
        });
      },
      fetchVehicleList
    };
  })
  .views(self => ({
    get vehicleLocations() {
      return self.vehicles
        .values()
        .filter(v => v.location)
        .map(v => {
          let location = v.location;
          return {
            lat: location.lat,
            lng: location.lng,
            licensePlate: v.licensePlate,
            speed: location.speed,
            courseval: location.courseval,
            landmark: location.landmark,
            gpstat: location.gpstat,
            time: location.formattedTime
          };
        });
    },
    get focusedVehicleStyle() {
      let focusedVehicle = self.vehicles
        .values()
        .filter(v => v.focused === true);
      return (
        (focusedVehicle.length > 0 && focusedVehicle[0].latlngStyle) || {
          lat: 0,
          lng: 0
        }
      );
    },
    get selectedVehicleStyle() {
      let focusedVehicle = self.selectedVehicle;
      return (
        (focusedVehicle && focusedVehicle.latlngStyle) || {
          lat: 0,
          lng: 0
        }
      );
    },
    vehicleByID(id) {
      return self.vehicles.get(id);
    },
    get sortedVehicles() {
      return sortVehicles(self.vehicles.values());
    },
    get vehiclesWithLocation() {
      return vehiclesWithLocation(self.vehicles.values());
    },
    get emptyList() {
      return self.vehicles.values().length === 0;
    }
  }));

function sortVehicles(vehicles) {
  return vehicles.sort(
    (a, b) =>
      a.licensePlate > b.licensePlate
        ? 1
        : a.licensePlate === b.licensePlate ? 0 : -1
  );
}

function vehiclesWithLocation(vehicles) {
  return vehicles.filter(v => v.location);
  // .sort(
  //   (a, b) =>
  //     a.licensePlate > b.licensePlate
  //       ? 1
  //       : a.licensePlate === b.licensePlate ? 0 : -1
  // );
}

export function VehicleModel() {
  // To deal with circular dependancy
  return Vehicle;
}
export default VehicleList;
