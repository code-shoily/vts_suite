import React from "react";
import { Link } from "react-router-dom";
import { observer } from "mobx-react";
import { compose } from "recompose";
import { Card, Icon } from "antd";

import VehicleProperties from "./VehicleProperties";
import { FLAT_COLORS } from "../config/constants";

const VehicleListItem = ({ vehicle, expanded }) => (
  <Card
    style={{ marginBottom: 10 }}
    title={
      <div
        style={
          vehicle.location
            ? { color: vehicle.location.colorCSS.background, fontWeight: 700 }
            : { fontWeight: 700 }
        }
      >
        {vehicle.licensePlate}
      </div>
    }
    extra={
      <Link to={`/single/${vehicle.id}`}>
        <Icon type="eye" style={{ color: FLAT_COLORS.belizeHole }} /> View
      </Link>
    }
    actions={[
      <span
        style={{
          cursor: "pointer",
          color: vehicle.focused ? FLAT_COLORS.alizarin : FLAT_COLORS.amethyst
        }}
        onClick={() => vehicle.setFocused()}
      >
        <Icon type="scan" /> Focus
      </span>,
      <span
        style={{ cursor: "pointer" }}
        onClick={() => vehicle.toggleExpanded()}
      >
        {vehicle.expanded ? (
          <span style={{ color: FLAT_COLORS.alizarin }}>
            <Icon type="arrow-up" /> Collapse
          </span>
        ) : (
          <span style={{ color: FLAT_COLORS.asbestos }}>
            <Icon type="arrow-down" /> Expand
          </span>
        )}
      </span>
    ]}
  >
    {vehicle.expanded && (
      <Card.Meta description={<VehicleProperties vehicle={vehicle} />} />
    )}
  </Card>
);

export default compose(observer)(VehicleListItem);
