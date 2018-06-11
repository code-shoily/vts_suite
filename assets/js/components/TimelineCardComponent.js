import React from "react";
import { observer } from "mobx-react";
import { compose } from "recompose";
import { Timeline, Card } from "antd";

import { FLAT_COLORS } from "../config/constants";

const TimelineCardComponent = ({
  store,
  title = "Timeline",
  pending = "Loading..."
}) => {
  return (
    <Card title={title} style={{ marginBottom: 10 }}>
      <Timeline pending={pending}>
        {store.locationList.sortedByLatestTime.map(l => {
          return (
            <Timeline.Item color={l.speed > store.speedLimit ? "red" : "green"}>
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
  );
};

export default compose(observer)(TimelineCardComponent);
