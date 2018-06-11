import React from "react";
import { inject, observer } from "mobx-react";
import { compose } from "recompose";
import { Row, Card } from "antd";
import {
  ResponsiveContainer,
  BarChart,
  Bar,
  XAxis,
  YAxis,
  Tooltip
} from "recharts";

const DashboardChartComponent = ({ store }) => (
  <Row>
    <Card type="inner" title="Current Speed" style={{ marginBottom: 10 }}>
      <ResponsiveContainer width="100%" height={100}>
        <BarChart data={store.vehicleList.vehicleLocations}>
          <Bar type="monotone" dataKey="speed" stroke="#8884d8" />
          <XAxis dataKey="licensePlate" />
          <YAxis />
          <Tooltip />
        </BarChart>
      </ResponsiveContainer>
    </Card>
  </Row>
);

export default compose(inject("store"), observer)(DashboardChartComponent);
