import React from "react";
import { inject, observer } from "mobx-react";
import { compose } from "recompose";
import { Row, Divider, Spin } from "antd";

import MenuOpenComponent from "./MenuOpenComponent";
import GroupSelectInputComponent from "./GroupSelectInputComponent";
import SpeedLoadingComponent from "./SpeedLoadingComponent";

const GroupSelectComponent = ({ store }) => (
  <Row>
    <MenuOpenComponent ui={store.ui} />
    {store.groupList.selectedGroup ? (
      <GroupSelectInputComponent groupList={store.groupList} />
    ) : (
      <Spin />
    )}
    <SpeedLoadingComponent locationList={store.locationList} />
    <Divider />
  </Row>
);

export default compose(inject("store"), observer)(GroupSelectComponent);
