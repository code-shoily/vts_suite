import React from "react";
import { observer } from "mobx-react";
import { Select } from "antd";

import { compose } from "recompose";

const VehicleSelectInputComponent = ({ vehicleList, width, onChange }) => {
  return (
    <Select
      showSearch
      value={vehicleList.selectedVehicle.licensePlate}
      style={{ width: 200 }}
      placeholder="Select a Vehicle"
      optionFilterProp="children"
      onChange={value => vehicleList.setSelectedVehicle(parseInt(value, 10))}
    >
      {vehicleList.vehicles.values().map(v => (
        <Select.Option value={v.id} key={v.id}>
          {v.licensePlate}
        </Select.Option>
      ))}
    </Select>
  );
};

export default compose(observer)(VehicleSelectInputComponent);
