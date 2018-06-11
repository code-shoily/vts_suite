import React from "react";
import { observer } from "mobx-react";
import InfoBox from "react-google-maps/lib/components/addons/InfoBox";
import { compose } from "recompose";
import { FLAT_COLORS } from "../config/constants";

const InfoBoxComponent = ({ vehicle }) => {
  return (
    <InfoBox
      position={
        new window.google.maps.LatLng(
          vehicle.location.lat,
          vehicle.location.lng
        )
      }
      options={{ closeBoxURL: ``, enableEventPropagation: true }}
    >
      <div
        style={{
          background: FLAT_COLORS.clouds,
          opacity: "1",
          color: FLAT_COLORS.midnightBlue,
          boxShadow:
            "0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)",
          padding: 5,
          margin: 5,
          ...vehicle.location.colorCSS
        }}
      >
        {vehicle.licensePlate}
      </div>
    </InfoBox>
  );
};

export default compose(observer)(InfoBoxComponent);
