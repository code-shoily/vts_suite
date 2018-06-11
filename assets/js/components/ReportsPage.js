import React from "react";
import { inject, observer } from "mobx-react";
import { compose } from "recompose";

const ReportsPage = ({ store, history }) => {
  return <div>Loading...</div>;
};

export default compose(inject("store"), observer)(ReportsPage);
