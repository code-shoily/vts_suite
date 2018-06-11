exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: "js/app.js"
    },
    stylesheets: {
      joinTo: "css/app.css"
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/assets/static". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(static)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: ["static", "css", "js", "vendor"],
    // Where to compile files to
    public: "../priv/static"
  },

  // Configure your plugins
  plugins: {
    less: {
      modules: true
    },
    babel: {
      // Do not use ES6 compiler in vendor code
      plugins: [
        [
          "import",
          {
            libraryName: "antd",
            style: false // or 'css'
          }
        ]
      ],
      presets: ["es2015", "react", "stage-2"],
      ignore: [/vendor/]
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["js/app"]
    }
  },
  npm: {
    enabled: true,
    whitelist: [
      "babel-polyfill",
      "phoenix",
      "phoenix_html",
      "react",
      "react-dom"
    ],
    styles: {
      antd: ["dist/antd.min.css"]
    }
  }
};
