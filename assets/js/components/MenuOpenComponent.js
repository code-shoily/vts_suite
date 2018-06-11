import React from "react";
import { observer } from "mobx-react";
import { Icon } from "antd";
import { compose } from "recompose";

const MenuOpenComponent = ({ ui }) => {
  return ui.sideBarCollapsed ? (
    <Icon
      type="menu-fold"
      style={{ cursor: "pointer", paddingRight: 10 }}
      onClick={() => ui.toggleSideBarCollapsed()}
    />
  ) : (
    <Icon
      type="menu-unfold"
      style={{ cursor: "pointer", paddingRight: 10 }}
      onClick={() => ui.toggleSideBarCollapsed()}
    />
  );
};

export default compose(observer)(MenuOpenComponent);
