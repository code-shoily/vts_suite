import React from "react";
import { observer } from "mobx-react";
import { compose } from "recompose";
import { Spin } from "antd";

const SpeedLoadingComponent = ({ locationList }) => {
  return locationList.locationListLoading ? (
    <span style={{ marginLeft: 10 }}>
      <Spin />
    </span>
  ) : null;
};

export default compose(observer)(SpeedLoadingComponent);
