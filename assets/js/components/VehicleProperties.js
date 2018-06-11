import React from "react";
import { observer } from "mobx-react";
import { compose } from "recompose";

const VehicleProperties = ({ vehicle }) => {
  let vehicleProperties = [
    {
      key: "Type",
      value: vehicle.vehicleType
    },
    {
      key: "Tag",
      value: vehicle.tag
    },
    {
      key: "Model",
      value: vehicle.model
    },
    {
      key: "Color",
      value: vehicle.color
    },
    {
      key: "Time",
      value: vehicle.location ? vehicle.location.formattedTime : " - "
    },
    {
      key: "Since",
      value: vehicle.location ? vehicle.location.timeSince : " - "
    },
    {
      key: "Speed",
      value: vehicle.location ? vehicle.location.speed + " KM/H" : " - "
    },
    {
      key: "Status",
      value: vehicle.location ? vehicle.location.gpstat : " - "
    },
    {
      key: "Landmark",
      value: vehicle.location ? vehicle.location.landmark : " - "
    }
  ];

  return (
    <table style={{ border: 1, width: "100%" }}>
      <tbody>
        {vehicleProperties.filter(tp => tp.value).map((tp, idx) => (
          <tr key={idx}>
            <th>{tp.key}</th>
            <td style={{ textAlign: "right" }}>{tp.value}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default compose(observer)(VehicleProperties);
