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
                                :class="[
                                    $route.name == 'portal.inicio'
                                        ? 'active-menu'
                                        : '',
                                ]"
                            >
                                <router-link
                                    :to="{ name: 'portal.inicio' }"
                                    v-loading.fullscreen.lock="
                                        fullscreenLoading
                                    "
                                    >Inicio</router-link
                                >
                            </li>

                            <li
                                :class="[
                                    $route.name == 'portal.secciones'
                                        ? 'active-menu'
                                        : '',
                                ]"
                            >
                                <router-link
                                    :to="{ name: 'portal.secciones' }"
                                    v-loading.fullscreen.lock="
                                        fullscreenLoading
                                    "
                                    >Secciones</router-link
                                >
                            </li>

                            <li
                                :class="[
                                    $route.name == 'portal.nosotros'
                                        ? 'active-menu'
                                        : '',
                                ]"
                            >
                                <router-link
                                    :to="{ name: 'portal.nosotros' }"
                                    v-loading.fullscreen.lock="
                                        fullscreenLoading
                                    "
                                    >Nosotros</router-link
                                >
                            </li>

                            <li
                                :class="[
                                    $route.name == 'portal.productos'
                                        ? 'active-menu'
                                        : '',
                                ]"
                            >
                                <router-link
                                    :to="{ name: 'portal.productos' }"
                                    v-loading.fullscreen.lock="
                                        fullscreenLoading
                                    "
                                    >Productos</router-link
                                >
                            </li>

                            <li
                                :class="[
                                    $route.name == 'portal.contactos'
                                        ? 'active-menu'
                                        : '',
                                ]"
                            >
                                <router-link
                                    :to="{ name: 'portal.contactos' }"
                                    v-loading.fullscreen.lock="
                                        fullscreenLoading
                                    "
                                    >Contactos</router-link
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
                                data-notify="2"
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
                        data-notify="2"
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
                <li class="active-menu">
                    <a href="">Inicio</a>
                </li>

                <li>
                    <a href="">Shop</a>
                </li>

                <li>
                    <a href="shoping-" class="label1 rs1" data-label1="hot"
                        >Features</a
                    >
                </li>

                <li>
                    <a href="">Blog</a>
                </li>

                <li>
                    <a href="">About</a>
                </li>

                <li>
                    <a href="">Contact</a>
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
        };
    },
    methods: {},
};
</script>
