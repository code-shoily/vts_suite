import React from "react";
import { Link } from "react-router-dom";
import { observer } from "mobx-react";
import { InfoWindow } from "react-google-maps";
import { compose } from "recompose";

const InfoWindowComponent = ({ vehicle, onToggleOpen }) => {
  return (
    <InfoWindow onCloseClick={onToggleOpen}>
      <div>
        <h5>{vehicle.licensePlate}</h5>
        <hr />
        <table style={{ width: "100%" }}>
          <thead />
          <tbody>
            <tr>
              <th>Time</th>
              <td style={{ textAlign: "right" }}>
                {vehicle.location.formattedTime}
              </td>
            </tr>
            <tr>
              <th>Speed</th>
              <td style={{ textAlign: "right" }}>
                {vehicle.location.speed} KM/H
              </td>
            </tr>
            <tr>
              <th>Location</th>
              <td style={{ textAlign: "right", padding: 10, paddingRight: 0 }}>
                {vehicle.location.landmark}
              </td>
            </tr>
            <tr>
              <td style={{ padding: 10 }}>
                <Link to={`/single/${vehicle.id}`}>Visit</Link>
              </td>
              <td style={{ textAlign: "right", padding: 10 }}>
                <a onClick={() => vehicle.toggleExpanded()}>Expand</a>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </InfoWindow>
  );
};

export default compose(observer)(InfoWindowComponent);
