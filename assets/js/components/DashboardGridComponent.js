import React from "react";
import { inject, observer } from "mobx-react";
import { compose } from "recompose";
import { Table, Card } from "antd";

const DashboardGridComponent = ({ store }) => {
  let columns = [
    {
      title: "Time",
      dataIndex: ["location", "latestTime"],
      key: "time",
      sorter: (a, b) =>
        a.location.latestTime > b.location.latestTime
          ? 1
          : a.location.latestTime === b.location.latestTime ? 0 : -1,
      render: (text, record) => record.location.formattedTime
    },
    {
      title: "Plate",
      dataIndex: "licensePlate",
      key: "licensePlate",
      sorter: (a, b) =>
        a.licensePlate > b.licensePlate
          ? 1
          : a.licensePlate === b.licensePlate ? 0 : -1
    },
    {
      title: "Speed",
      dataIndex: ["location", "speed"],
      key: "speed",
      sorter: (a, b) =>
        a.location.speed > b.location.speed
          ? 1
          : a.location.speed === b.location.speed ? 0 : -1,
      render: (text, record) => `${text} KM/H`
    },
    {
      title: "Landmark",
      dataIndex: ["location", "landmark"],
      key: "landmark"
    }
  ];
  return (
    <Card type="inner" title="Data Grid" style={{ marginBottom: 16 }}>
      <div>
        <Table
          rowKey="id"
          dataSource={store.vehicleList.vehiclesWithLocation}
          columns={columns}
        />
      </div>
    </Card>
  );
};

export default compose(inject("store"), observer)(DashboardGridComponent);
