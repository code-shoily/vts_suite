import React from "react";
import { Switch, Route } from "react-router-dom";
import { inject, observer } from "mobx-react";
import { compose, withState, lifecycle } from "recompose";
import { Layout } from "antd";

import MenuComponent from "./MenuComponent";
import ProfileComponent from "./ProfileComponent";

import DashboardPage from "./DashboardPage";
import SinglePage from "./SinglePage";
import MultiPage from "./MultiPage";
import ReportsPage from "./ReportsPage";
import NotificationsPage from "./NotificationsPage";

const { Content, Sider } = Layout;

const LandingPage = ({ store, history, collapsed }) => (
  <Layout>
    <Layout>
      <Sider
        collapsible
        trigger={null}
        collapsed={store.ui.sideBarCollapsed}
        collapsedWidth={0}
      >
        <ProfileComponent />
        <MenuComponent history={history} store={store} />
      </Sider>
      <Layout>
        <Content>
          <div style={{ minHeight: "100vh", padding: 20 }}>
            <Switch>
              <Route exact path="/" component={DashboardPage} />
              <Route exact path="/single" component={SinglePage} />
              <Route exact path="/single/:id" component={SinglePage} />
              <Route exact path="/multi" component={MultiPage} />
              <Route exact path="/reports" component={ReportsPage} />
              <Route
                exact
                path="/notifications"
                component={NotificationsPage}
              />
            </Switch>
          </div>
        </Content>
      </Layout>
    </Layout>
  </Layout>
);

export default compose(
  inject("store"),
  lifecycle({
    componentDidMount() {
      this.props.store.groupList.fetchGroupList();
    }
  }),
  withState("collapsed", "setCollapsed", true),
  observer
)(LandingPage);
