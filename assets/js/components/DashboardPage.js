import React from "react";
import { inject, observer } from "mobx-react";
import { compose } from "recompose";
import { Row, Col } from "antd";

import GroupSelectComponent from "./GroupSelectComponent";
import VehicleListComponent from "./VehicleListComponent";
import DashboardMapComponent from "./DashboardMapComponent";
import DashboardGridComponent from "./DashboardGridComponent";
import DashboardChartComponent from "./DashboardChartComponent";

const DashboardPage = ({ store, history }) => {
  return (
    <div>
      <GroupSelectComponent />
      <Row gutter={16}>
        <Col lg={18} sm={24}>
          <DashboardMapComponent />
          <DashboardGridComponent />
          <DashboardChartComponent />
        </Col>
        <Col lg={6} sm={24}>
          <VehicleListComponent />
        </Col>
      </Row>
    </div>
  );
};

export default compose(inject("store"), observer)(DashboardPage);
