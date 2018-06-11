import React from "react";
import { inject, observer } from "mobx-react";
import { Row, Col, Timeline, Card } from "antd";
import { compose, lifecycle } from "recompose";
import { FLAT_COLORS } from "../config/constants";
import {
  BarChart,
  Bar,
  LineChart,
  Line,
  Tooltip,
  CartesianGrid,
  XAxis,
  YAxis,
  ResponsiveContainer
} from "recharts";

import VehicleProperties from "./VehicleProperties";
import VehicleSelectComponent from "./VehicleSelectComponent";
import SingleMapComponent from "./SingleMapComponent";

const SpeedCard = observer(({ store }) => (
  <Card type="inner" title="Speeds" style={{ marginBottom: 10 }}>
    <ResponsiveContainer width="100%" height={200}>
      <BarChart
        data={store.locationList.locationsForVehicle(
          store.vehicleList.selectedVehicle.id
        )}
      >
        <Bar type="monotone" dataKey="speed" fill="#8884d8" />
        <CartesianGrid strokeDasharray="3 3" />
        <Tooltip />
        <XAxis dataKey={"formattedTime"} />
        <YAxis />
      </BarChart>
    </ResponsiveContainer>
  </Card>
));

const DirectionCard = observer(({ store }) => (
  <Card type="inner" title="Directions" style={{ marginBottom: 10 }}>
    <ResponsiveContainer width="100%" height={200}>
      <LineChart
        data={store.locationList.locationsForVehicle(
          store.vehicleList.selectedVehicle.id
        )}
      >
        <Line type="monotone" dataKey="courseval" fill="#8884d8" />
        <CartesianGrid strokeDasharray="3 3" />
        <Tooltip />
        <XAxis dataKey={"formattedTime"} />
        <YAxis />
      </LineChart>
    </ResponsiveContainer>
  </Card>
));

const AccuracyCard = observer(({ store }) => (
  <Card type="inner" title="Accuracy" style={{ marginBottom: 10 }}>
    <ResponsiveContainer width="100%" height={200}>
      <LineChart
        data={store.locationList.locationsForVehicle(
          store.vehicleList.selectedVehicle.id
        )}
      >
        <Line type="monotone" dataKey="accuracy" fill="#8884d8" />
        <CartesianGrid strokeDasharray="3 3" />
        <Tooltip />
        <XAxis dataKey={"formattedTime"} />
        <YAxis />
      </LineChart>
    </ResponsiveContainer>
  </Card>
));

const TimelineCardComponent = observer(({ store }) => (
  <Card type="inner" title="Timeline" style={{ marginBottom: 10 }}>
    <Timeline pending="Recording...">
      {store.locationList
        .locationsForVehicle(store.vehicleList.selectedVehicle.id)
        .map(l => {
          return (
            <Timeline.Item
              key={l.id}
              color={l.speed > store.speedLimit ? "red" : "green"}
            >
              <span
                style={{
                  color: FLAT_COLORS.belizeHole,
                  fontWeight: 700
                }}
              >
                [{l.timeSince}]
              </span>{" "}
              <span style={{ fontWeight: 700 }}>
                {l.vehicleObject.licensePlate}
              </span>{" "}
              was
              {l.speed > 0
                ? ` moving at speed ${l.speed} KM/H towards `
                : " stopped near "}
              <span
                style={{
                  fontWeight: 700,
                  color: FLAT_COLORS.nephritis
                }}
              >
                {l.landmark}
              </span>
            </Timeline.Item>
          );
        })}
    </Timeline>
  </Card>
));

const SinglePage = ({ store, history }) => {
  let vehicle = store.vehicleList.selectedVehicle;

  return (
    <div>
      <VehicleSelectComponent />
      <Row gutter={16}>
        <Col lg={8} sm={24}>
          <Row>
            <SingleMapComponent />
          </Row>
        </Col>
        <Col lg={8} sm={24}>
          <Row>
            <Card
              type="inner"
              title="Info"
              style={{ marginBottom: 10 }}
              actions={[
                <a style={{ color: FLAT_COLORS.nephritis }}>Engine Start</a>,
                <a style={{ color: FLAT_COLORS.amethyst }}>Take Photo</a>,
                <a style={{ color: FLAT_COLORS.alizarin }}>Engine Stop</a>
              ]}
            >
              <VehicleProperties vehicle={vehicle} />
            </Card>
          </Row>
          <Row>
            <SpeedCard store={store} />
          </Row>
          <Row>
            <DirectionCard store={store} />
          </Row>
          <Row>
            <AccuracyCard store={store} />
          </Row>
        </Col>
        <Col lg={8} sm={24}>
          <TimelineCardComponent store={store} />
        </Col>
      </Row>
    </div>
  );
};

export default compose(
  inject("store"),
  lifecycle({
    componentDidMount() {
      if (this.props.match.params.id)
        this.props.store.vehicleList.setSelectedVehicle(
          parseInt(this.props.match.params.id, 10)
        );
    }
  }),
  observer
)(SinglePage);
