import React from "react";
import { inject, observer } from "mobx-react";
import { Card, Row, Col } from "antd";
import { compose } from "recompose";

import SpeedLimitSelectComponent from "./SpeedLimitSelectComponent";
import TimelineCardComponent from "./TimelineCardComponent";

const NotificationsPage = ({ store, history }) => {
  return (
    <div>
      <SpeedLimitSelectComponent />
      <Row gutter={16}>
        <Col lg={12} sm={24}>
          <TimelineCardComponent store={store} />
        </Col>
        <Col lg={12} sm={24}>
          <Card title="Activities" style={{ marginBottom: 10 }}>
            <div>No notifications yet</div>
          </Card>
        </Col>
      </Row>
    </div>
  );
};

export default compose(inject("store"), observer)(NotificationsPage);
