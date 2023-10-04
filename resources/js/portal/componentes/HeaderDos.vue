<template>
    <!-- Header -->
    <header class="header-v2">
        <!-- Header desktop -->
        <div class="container-menu-desktop trans-03">
            <div class="wrap-menu-desktop">
                <nav class="limiter-menu-desktop p-l-45">
                    <!-- Logo desktop -->
                    <a href="#" class="logo">
                        <strong>QHANA</strong> BOLIVIA
                    </a>

                    <!-- Menu desktop -->
                    <div class="menu-desktop">
                        <ul class="main-menu">
                            <li
                                v-for="item in listMenu"
                                :class="[
                                    $route.name == item.ruta
                                        ? 'active-menu'
                                        : '',
                                ]"
                            >
                                <router-link
                                    :to="{ name: item.ruta }"
                                    v-loading.fullscreen.lock="
                                        fullscreenLoading
                                    "
                                    >{{ item.label }}</router-link
                                >
                            </li>
                        </ul>
                    </div>

                    <!-- Icon header -->
                    <div class="wrap-icon-header flex-w flex-r-m h-full">
                        <!-- <div class="flex-c-m h-full p-r-24">
                            <div
                                class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 js-show-modal-search"
                            >
                                <i class="zmdi zmdi-search"></i>
                            </div>
                        </div> -->

                        <div class="flex-c-m h-full p-l-18 p-r-25 bor5">
                            <a
                                href="/administracion"
                                class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11"
                            >
                                <i class="zmdi zmdi-sign-in"></i>
                            </a>
                        </div>

                        <div class="flex-c-m h-full p-l-18 p-r-25 bor5">
                            <div
                                class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 icon-header-noti js-show-cart"
                                :data-notify="cantidad_carrito"
                            >
                                <i class="zmdi zmdi-shopping-cart"></i>
                            </div>
                        </div>

                        <!-- <div class="flex-c-m h-full p-lr-19">
                            <div
                                class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 js-show-sidebar"
                            >
                                <i class="zmdi zmdi-menu"></i>
                            </div>
                        </div> -->
                    </div>
                </nav>
            </div>
        </div>

        <!-- Header Mobile -->
        <div class="wrap-header-mobile">
            <!-- Logo moblie -->
            <div class="logo-mobile">
                <a href=""> <strong>QHANA</strong> BOLIVIA </a>
            </div>

            <!-- Icon header -->
            <div class="wrap-icon-header flex-w flex-r-m h-full m-r-15">
                <div class="flex-c-m h-full p-r-10">
                    <a
                        href="/administracion"
                        class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11"
                    >
                        <i class="zmdi zmdi-sign-in"></i>
                    </a>
                </div>

                <!-- <div class="flex-c-m h-full p-r-10">
                    <div
                        class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 js-show-modal-search"
                    >
                        <i class="zmdi zmdi-search"></i>
                    </div>
                </div> -->

                <div class="flex-c-m h-full p-lr-10 bor5">
                    <div
                        class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 icon-header-noti js-show-cart"
                        :data-notify="cantidad_carrito"
                    >
                        <i class="zmdi zmdi-shopping-cart"></i>
                    </div>
                </div>
            </div>

            <!-- Button show menu -->
            <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
                <span class="hamburger-box">
                    <span class="hamburger-inner"></span>
                </span>
            </div>
        </div>

        <!-- Menu Mobile -->
        <div class="menu-mobile">
            <ul class="main-menu-m">
                <li
                    v-for="item in listMenu"
                    :class="[$route.name == item.ruta ? 'active-menu' : '']"
                >
                    <router-link :to="{ name: item.ruta }">{{
                        item.label
                    }}</router-link>
                </li>
            </ul>
        </div>

        <!-- Modal Search -->
        <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
            <div class="container-search-header">
                <button
                    class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search"
                >
                    <img src="images/icons/icon-close2.png" alt="CLOSE" />
                </button>

                <form class="wrap-search-header flex-w p-l-15">
                    <button class="flex-c-m trans-04">
                        <i class="zmdi zmdi-search"></i>
                    </button>
                    <input
                        class="plh3"
                        type="text"
                        name="search"
                        placeholder="Search..."
                    />
                </form>
            </div>
        </div>
    </header>
</template>
<script>
export default {
    data() {
        return {
            fullscreenLoading: false,
            listMenu: [
                {
                    label: "Inicio",
                    ruta: "portal.inicio",
                },
                {
                    label: "Actividades",
                    ruta: "portal.actividads",
                },
                {
                    label: "Nosotros",
                    ruta: "portal.nosotros",
                },
                {
                    label: "Productos",
                    ruta: "portal.productos",
                },
                {
                    label: "Contactos",
                    ruta: "portal.contactos",
                },
                {
                    label: "Tú carrito",
                    ruta: "portal.carrito",
                },
            ],
            cantidad_carrito: 0,
            carrito: [],
        };
    },
    mounted() {
        this.animacionHeader();
        this.getCarrito();
        EventBus.$on("producto_agregado", () => {
            this.getCarrito();
        });
        let self = this;
        setTimeout(function () {
            self.initShowCarrito();
        }, 300);
    },
    methods: {
        getCarrito() {
            if (localStorage.getItem("carrito_qhana")) {
                this.carrito = JSON.parse(
                    localStorage.getItem("carrito_qhana")
                );
                this.cantidad_carrito = this.carrito.length;
            } else {
                this.cantidad_carrito;
            }
        },

        animacionHeader() {
            /*==================================================================
            [ Fixed Header ]*/
            var headerDesktop = $(".container-menu-desktop");
            var wrapMenu = $(".wrap-menu-desktop");

            if ($(".top-bar").length > 0) {
                var posWrapHeader = $(".top-bar").height();
            } else {
                var posWrapHeader = 0;
            }

            if ($(window).scrollTop() > posWrapHeader) {
                $(headerDesktop).addClass("fix-menu-desktop");
                $(wrapMenu).css("top", 0);
            } else {
                $(headerDesktop).removeClass("fix-menu-desktop");
                $(wrapMenu).css("top", posWrapHeader - $(this).scrollTop());
            }

            $(window).on("scroll", function () {
                if ($(this).scrollTop() > posWrapHeader) {
                    $(headerDesktop).addClass("fix-menu-desktop");
                    $(wrapMenu).css("top", 0);
                } else {
                    $(headerDesktop).removeClass("fix-menu-desktop");
                    $(wrapMenu).css("top", posWrapHeader - $(this).scrollTop());
                }
            });

            /*==================================================================
            [ Menu mobile ]*/
            $(".btn-show-menu-mobile").on("click", function () {
                $(this).toggleClass("is-active");
                $(".menu-mobile").slideToggle();
            });

            var arrowMainMenu = $(".arrow-main-menu-m");

            for (var i = 0; i < arrowMainMenu.length; i++) {
                $(arrowMainMenu[i]).on("click", function () {
                    $(this).parent().find(".sub-menu-m").slideToggle();
                    $(this).toggleClass("turn-arrow-main-menu-m");
                });
            }

            $(window).resize(function () {
                if ($(window).width() >= 992) {
                    if ($(".menu-mobile").css("display") == "block") {
                        $(".menu-mobile").css("display", "none");
                        $(".btn-show-menu-mobile").toggleClass("is-active");
                    }

                    $(".sub-menu-m").each(function () {
                        if ($(this).css("display") == "block") {
                            console.log("hello");
                            $(this).css("display", "none");
                            $(arrowMainMenu).removeClass(
                                "turn-arrow-main-menu-m"
                            );
                        }
                    });
                }
            });
        },
        initShowCarrito() {
            /*==================================================================
            [ Cart ]*/
            $(".js-show-cart").on("click", function () {
                $(".js-panel-cart").addClass("show-header-cart");
            });

            $(".js-hide-cart").on("click", function () {
                $(".js-panel-cart").removeClass("show-header-cart");
            });

            /*==================================================================
            [ Cart ]*/
            $(".js-show-sidebar").on("click", function () {
                $(".js-sidebar").addClass("show-sidebar");
            });

            $(".js-hide-sidebar").on("click", function () {
                $(".js-sidebar").removeClass("show-sidebar");
            });
        },
    },
};
</script>
