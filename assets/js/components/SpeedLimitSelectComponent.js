import React from "react";
import { inject, observer } from "mobx-react";
import { compose } from "recompose";
import { Row, Select, Divider } from "antd";

import MenuOpenComponent from "./MenuOpenComponent";
import SpeedLoadingComponent from "./SpeedLoadingComponent";

const SpeedLimitSelectComponent = ({ store }) => {
  let speeds = [20, 40, 60, 80, 100];
  return (
    <Row>
      <MenuOpenComponent ui={store.ui} />
      <Select
        defaultValue={speeds[0]}
        value={store.speedLimit + " KM/H"}
        style={{ width: 200 }}
        placeholder="Select a Speed"
        onChange={value => store.setSpeedLimit(value)}
      >
        {speeds.map(s => (
          <Select.Option value={s} key={s}>
            {s} KM/H
          </Select.Option>
        ))}
      </Select>
      <SpeedLoadingComponent locationList={store.locationList} />
      <Divider />
    </Row>
  );
};

export default compose(inject("store"), observer)(SpeedLimitSelectComponent);
