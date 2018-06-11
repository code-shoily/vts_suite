import "babel-polyfill";

import React from "react";
import ReactDOM from "react-dom";
import { Provider } from "mobx-react";
import { getSnapshot } from "mobx-state-tree";
import { connectReduxDevtools } from "mst-middlewares";
import { HashRouter as Router } from "react-router-dom";

import { default as MainStore } from "./stores/main";
import App from "./components/App";
import registerServiceWorker from "./registerServiceWorker";
import { loadFromStorage } from "./stores/auth";
import LoadingFlags from "./stores/loading-flags";

function createMainStore() {
  let loadingFlags = LoadingFlags.create({ id: "1" });
  store = MainStore.create({
    loadingFlags,
    auth: loadFromStorage(loadingFlags)
  });
  return store;
}

let store = createMainStore();

if (process.env.NODE_ENV === "development")
  connectReduxDevtools(require("remotedev"), store);

function renderApp(AppComponent, rootStore) {
  ReactDOM.render(
    <Provider store={rootStore}>
      <Router>
        <AppComponent />
      </Router>
    </Provider>,
    document.getElementById("root")
  );
}

renderApp(App, store);

// Connect HMR
if (module.hot) {
  module.hot.accept(["./stores/main"], () => {
    // Store definition changed, recreate a new one from old state
    renderApp(App, getSnapshot(store));
  });

  module.hot.accept(["./components/App"], () => {
    // Componenent definition changed, re-render app
    renderApp(App, store);
  });
}

registerServiceWorker();
