import { types, flow, getParent } from "mobx-state-tree";
import { GROUP_URL, headerFunc } from "../config/constants";
import axios from "axios";

const Group = types.model("Group", {
  id: types.identifier(types.number),
  code: types.string,
  name: types.string,
  groupType: types.string
});

const GroupList = types
  .model("GroupList", {
    groups: types.array(types.maybe(Group)),
    selectedGroup: types.maybe(types.reference(Group))
  })
  .actions(self => {
    let fetchGroupList = flow(function*() {
      try {
        let { data } = yield axios.get(
          GROUP_URL,
          headerFunc(getParent(self).auth.key)
        );
        self.groups = [];
        data.map(d =>
          self.groups.push(
            Group.create({
              id: d.id,
              code: d.code,
              groupType: d.groupType,
              name: d.name
            })
          )
        );
        if (self.groups.length > 0) self.selectedGroup = self.groups[0];

        getParent(self).vehicleList.fetchVehicleList();

        if (self.groups.length > 1) {
          getParent(self).user.setAdminMode(true);
        }
      } catch (error) {
        console.warn(error);
      } finally {
      }
    });
    return {
      setSelectedGroup(groupID) {
        self.selectedGroup = groupID;
        getParent(self).locationList.reset();
        getParent(self).vehicleList.reset();
        getParent(self).vehicleList.fetchVehicleList();
      },
      reset() {
        self.groups = [];
        self.selectedGroup = null;
      },
      fetchGroupList
    };
  })
  .views(self => ({
    get emptyList() {
      return self.groups.length === 0;
    },
    get singleGroup() {
      return self.groups.length === 1;
    }
  }));

export default GroupList;
