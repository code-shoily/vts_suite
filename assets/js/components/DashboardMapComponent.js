import React from "react";
import { inject, observer } from "mobx-react";
import {
  GoogleMap,
  TrafficLayer,
  Marker,
  withGoogleMap,
  withScriptjs
} from "react-google-maps";
import { compose, withProps, withStateHandlers } from "recompose";
import { Row } from "antd";

import InfoBoxComponent from "./InfoBoxComponent";
import InfoWindowComponent from "./InfoWindowComponent";
import { GOOGLE_MAP_URL } from "../config/constants";

const MapComponent = ({ store, openInfoWindow, openedID, onToggleOpen }) => {
  let vehicleList = store.vehicleList;
  return (
    <GoogleMap defaultZoom={18} center={vehicleList.focusedVehicleStyle}>
      <TrafficLayer autoUpdate />
      {vehicleList.vehiclesWithLocation &&
        vehicleList.vehiclesWithLocation.map(v => (
          <Marker
            key={v.location.id}
            position={{ lat: v.location.lat, lng: v.location.lng }}
            onClick={() => openInfoWindow(v.id)}
            options={{
              icon: {
                url: v.location.getIcon
              }
            }}
          >
            {openedID === v.id && (
              <InfoWindowComponent vehicle={v} onToggleOpen={onToggleOpen} />
            )}
          </Marker>
        ))}

      {vehicleList.vehiclesWithLocation &&
        vehicleList.vehiclesWithLocation.map(v => (
          <InfoBoxComponent vehicle={v} key={v.location.id} />
        ))}
    </GoogleMap>
  );
};

const LocationMap = compose(
  withStateHandlers(
    () => ({
      openedID: null
    }),
    {
      onToggleOpen: ({ openID }) => () => ({
        openID: null
      }),
      openInfoWindow: ({ openedID }) => id => ({
        openedID: id
      })
    }
  ),
  observer
)(MapComponent);

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
          height: `400px`,
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
