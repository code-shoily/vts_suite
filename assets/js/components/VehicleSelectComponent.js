import React from "react";
import { inject, observer } from "mobx-react";
import { compose } from "recompose";
import { Row, Divider, Spin } from "antd";

import MenuOpenComponent from "./MenuOpenComponent";
import SpeedLoadingComponent from "./SpeedLoadingComponent";
import VehicleSelectInputComponent from "./VehicleSelectInputComponent";

const VehicleSelectComponent = ({ store }) => (
  <Row>
    <MenuOpenComponent ui={store.ui} />
    {store.vehicleList.selectedVehicle ? (
      <VehicleSelectInputComponent vehicleList={store.vehicleList} />
    ) : (
      <Spin />
    )}
    <SpeedLoadingComponent locationList={store.locationList} />
    <Divider />
  </Row>
);

export default compose(inject("store"), observer)(VehicleSelectComponent);
