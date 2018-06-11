import React from "react";
import { inject, observer } from "mobx-react";
import {
  GoogleMap,
  TrafficLayer,
  Marker,
  withGoogleMap,
  withScriptjs
} from "react-google-maps";
import { compose, withProps } from "recompose";
import { Row } from "antd";
import { GOOGLE_MAP_URL } from "../config/constants";

const MapComponent = ({ store }) => {
  let vehicleList = store.vehicleList;
  return vehicleList.selectedVehicle.location ? (
    <GoogleMap
      ref="gmap"
      defaultZoom={18}
      center={vehicleList.selectedVehicleStyle}
    >
      <TrafficLayer autoUpdate />
      <Marker
        position={{
          lat: vehicleList.selectedVehicle.location.lat,
          lng: vehicleList.selectedVehicle.location.lng
        }}
        options={{
          icon: {
            url: vehicleList.selectedVehicle.location.getIcon
          }
        }}
      />
    </GoogleMap>
  ) : (
    <div style={{ width: "100%", textAlign: "center" }}>
      No location available
    </div>
  );
};

const LocationMap = compose(observer)(MapComponent);

const DashboardMapComponent = ({ store }) => (
  <Row style={{ marginBottom: 20 }}>
    <LocationMap store={store} />
  </Row>
);

export default compose(
  inject("store"),
  withProps({
    googleMapURL: GOOGLE_MAP_URL,
    loadingElement: <div style={{ height: `100%` }} />,
    containerElement: (
      <div
        style={{
          height: `800px`,
          marginBottom: 20,
          padding: 20,
          background: "white"
        }}
      />
    ),
    mapElement: <div style={{ height: `100%` }} />
  }),
  withScriptjs,
  withGoogleMap,
  observer
)(DashboardMapComponent);
