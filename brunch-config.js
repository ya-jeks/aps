exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: {
        "js/app.js": /^(web\/static\/js)|(node_modules)/,
        "js/vendor.js": /^(web\/static\/vendor\/js)|(deps)/,
        "js/login.js": "web/static/js/login.js"
      },

      // To use a separate vendor.js bundle, specify two files path
      // http://brunch.io/docs/config#-files-
      // joinTo: {
      //  "js/app.js": /^(web\/static\/js)/,
      //  "js/sch.min.js": [
      //    "node_modules/fullcalendar/dist/fullcalendar.min.js",
      //    "node_modules/fullcalendar-scheduler/dist/scheduler.min.js"
      //  ],
      // }
      //
      // To change the order of concatenation of files, explicitly mention here
      // order: {
      //   before: [
      //     "web/static/vendor/js/jquery-2.1.1.js",
      //     "web/static/vendor/js/bootstrap.min.js"
      //   ]
      // }
    },
    stylesheets: {
      joinTo: "css/app.css",
      order: {
        after: ["web/static/css/app.scss"] // concat app.css last
      }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/web/static/assets". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(web\/static\/assets)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: [
      "web/static",
      "test/static"
    ],

    // Where to compile files to
    public: "priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/web\/static\/vendor\/js/, /web\/static\/vendor\/js\/\*\.coffee/]
    },
    copycat: {
      "fonts": [
        "node_modules/bootstrap-sass/assets/fonts/bootstrap",
        "node_modules/font-awesome/fonts"
      ]
    },
    sass: {
      options: {
        includePaths: ["node_modules/bootstrap-sass/assets/stylesheets"], // tell sass-brunch where to look for files to @import
        precision: 8 // minimum precision required by bootstrap-sass
      }
    },
    coffeescript: {
      bare: true
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["web/static/js/app"],
    }
  },

  npm: {
    enabled: true,
    globals: {
      $: 'jquery',
      jQuery: 'jquery',
      moment: 'moment',
      bootstrap: 'bootstrap-sass',
      axios: 'axios/dist/axios.js'
      // Vue: 'vue/dist/vue.common.js'
    }
  }
};
