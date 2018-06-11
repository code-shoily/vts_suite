import React from "react";
import { observer } from "mobx-react";
import { Select } from "antd";

import { compose } from "recompose";

const GroupSelectInputComponent = ({ groupList, width, onChange }) => {
  return (
    <Select
      showSearch
      defaultValue={groupList.selectedGroup.name}
      style={{ width: width || 200 }}
      placeholder="Select a Group"
      optionFilterProp="children"
      onChange={
        onChange || (value => groupList.setSelectedGroup(parseInt(value, 10)))
      }
    >
      {groupList.groups.map(g => (
        <Select.Option value={g.id} key={g.id}>
          {g.name}
        </Select.Option>
      ))}
    </Select>
  );
};

export default compose(observer)(GroupSelectInputComponent);
