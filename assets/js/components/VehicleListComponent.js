import React from "react";
import { inject, observer } from "mobx-react";
import { compose, withState } from "recompose";
import { Row, Spin } from "antd";

import VehicleListItem from "./VehicleListItem";

const VehicleListComponent = ({ store, expanded, setExpanded }) => {
  return store.vehicleList.emptyList ? (
    <Spin />
  ) : (
    <Row>
      {store.vehicleList.sortedVehicles.map(v => (
        <VehicleListItem key={v.id} vehicle={v} expanded={expanded} />
      ))}
    </Row>
  );
};

export default compose(
  inject("store"),
  withState("expanded", "setExpanded", false),
  observer
)(VehicleListComponent);
