import React from "react";
import { Menu, Icon } from "antd";

import { FLAT_COLORS, ADMIN_URL } from "../config/constants";

const MenuComponent = ({ store, history }) => {
  let adminStyle = {
    background: FLAT_COLORS.nephritis,
    color: FLAT_COLORS.clouds
  };
  let logoutStyle = {
    background: FLAT_COLORS.alizarin,
    color: FLAT_COLORS.clouds
  };
  let menuClick = ({ key }) => {
    switch (parseInt(key, 10)) {
      case 1:
        history.push("/");
        break;
      case 2:
        history.push("/single");
        break;
      case 3:
        history.push("/multi");
        break;
      case 4:
        history.push("/reports");
        break;
      case 5:
        history.push("/notifications");
        break;
      case 6:
        window.open(ADMIN_URL, "_blank");
        break;
      case 7:
        store.reset();
        break;
      default:
        store.reset();
    }
  };
  return (
    <Menu
      theme="dark"
      mode="inline"
      defaultSelectedKeys={["1"]}
      onClick={menuClick}
    >
      <Menu.Item key="1">
        <Icon type="dashboard" /> Dashboard
      </Menu.Item>
      <Menu.Item key="2">
        <Icon type="scan" /> Single Mode
      </Menu.Item>
      <Menu.Item key="3">
        <Icon type="appstore-o" /> Multi Mode
      </Menu.Item>
      <Menu.Item key="4">
        <Icon type="line-chart" /> Reports
      </Menu.Item>
      <Menu.Item key="5">
        <Icon type="inbox" /> Notifications
      </Menu.Item>
      <Menu.Item key="6" style={adminStyle}>
        <Icon type="paper-clip" /> Admin
      </Menu.Item>
      <Menu.Item key="7" style={logoutStyle}>
        <Icon type="logout" /> Logout
      </Menu.Item>
    </Menu>
  );
};

export default MenuComponent;
