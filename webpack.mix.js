const mix = require("laravel-mix");

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */
mix.setPublicPath("./")
    .js("resources/js/app.js", "./js")
    .vue()
    .sass("resources/sass/app.scss", "./css")
    .styles(
        [
            "resources/assets/css/all.min.css",
            "resources/assets/css/icheck-bootstrap.css",
            "resources/assets/css/adminlte.css",
            "resources/assets/css/config.css",
        ],
        "./css/plantilla.css"
    )
    .styles(
        [
            "resources/assets/css/all.min.css",
            "resources/assets/css/portal/material-design-iconic-font.min.css",
            "resources/assets/css/portal/icon-font.min.css",
            "resources/assets/css/portal/animate.css",
            "resources/assets/css/portal/hamburgers.min.css",
            "resources/assets/css/portal/animsition.min.css",
            "resources/assets/css/portal/select2.min.css",
            "resources/assets/css/portal/daterangepicker.css",
            "resources/assets/css/portal/slick.css",
            "resources/assets/css/portal/magnific-popup.css",
            "resources/assets/css/portal/perfect-scrollbar.css",
            "resources/assets/css/portal/util.css",
            "resources/assets/css/portal/main.css",
            "resources/assets/css/portal.css",
        ],
        "./css/portal.css"
    )
    .scripts(["resources/assets/js/jquery-3.2.1.min.js"], "./js/jquery.js")
    .scripts(
        ["resources/assets/js/adminlte.min.js", "resources/assets/js/demo.js"],
        "./js/plantilla.js"
    )
    .scripts(
        [
            "resources/assets/js/portal/animsition.min.js",
            "resources/assets/js/portal/select2.min.js",
            "resources/assets/js/portal/moment.min.js",
            "resources/assets/js/portal/daterangepicker.js",
            "resources/assets/js/portal/slick.min.js",
            "resources/assets/js/portal/parallax100.js",
            "resources/assets/js/portal/jquery.magnific-popup.min.js",
            "resources/assets/js/portal/isotope.pkgd.min.js",
            "resources/assets/js/portal/perfect-scrollbar.min.js",
        ],
        "./js/portal.js"
    )
    .scripts(
        [
            "resources/assets/js/portal/slick-custom.js",
            "resources/assets/js/portal/main.js",
        ],
        "./js/portal_custom.js"
    )
    .copy("resources/assets/imgs", "./imgs")
    .copy("resources/assets/images", "./images")
    .copy("resources/assets/webfonts", "./webfonts")
    .copy("resources/assets/webfont", "./webfont")
    .copy("resources/assets/fonts", "./fonts");
