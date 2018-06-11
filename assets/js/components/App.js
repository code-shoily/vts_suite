import { compose } from "recompose";
import { observer, inject } from "mobx-react";
import React from "react";
import { Route, withRouter } from "react-router-dom";
import LoginPage from "./LoginPage";
import LandingPage from "./LandingPage";
// import "antd/dist/antd.css";

const App = ({ store: { auth } }) => {
  return (
    <Route path="/" component={auth.isLoggedIn() ? LandingPage : LoginPage} />
  );
};

export default compose(withRouter, inject("store"), observer)(App);
