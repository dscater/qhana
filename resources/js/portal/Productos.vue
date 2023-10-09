<template>
    <!-- Blog -->
    <section class="sec-blog bg0 p-b-90 fondo_seccion contenedor_productos">
        <div class="container-fluid p-0 mb-4">
            <div class="bg-dark">
                <h2
                    class="ltext-105 cl5 txt-center respon1 text-warning pt-3 pb-3"
                >
                    PRODUCTOS
                </h2>
            </div>
        </div>
        <div class="container bg-dark wow fadeInUp" wow-data-delay="0.2s">
            <div class="flex-w flex-sb-m p-b-52">
                <div class="flex-w flex-c-m m-tb-10">
                    <div
                        class="flex-c-m stext-106 cl11 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter"
                    >
                        <i
                            class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list text-warning"
                        ></i>
                        <i
                            class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"
                        ></i>
                        Filtro
                    </div>

                    <div
                        class="flex-c-m stext-106 cl11 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search"
                    >
                        <i
                            class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search text-warning"
                        ></i>
                        <i
                            class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"
                        ></i>
                        Buscar
                    </div>
                </div>

                <!-- Search product -->
                <div class="dis-none panel-search w-full bg-white">
                    <div class="bor8 dis-flex p-l-15">
                        <button
                            class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04"
                        >
                            <i class="zmdi zmdi-search"></i>
                        </button>

                        <input
                            class="mtext-107 cl2 size-114 plh2 p-r-15"
                            type="text"
                            name="search-product"
                            placeholder="Buscar"
                            id="btnBuscarProducto"
                        />
                    </div>
                </div>

                <!-- Filter -->
                <div class="dis-none panel-filter w-full p-t-10">
                    <div
                        class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm"
                    >
                        <div class="col-3">
                            <div class="mtext-102 cl2 p-b-15">Ordenar por</div>

                            <ul>
                                <li class="p-b-6">
                                    <a
                                        href="#"
                                        class="filter-link stext-106 trans-04 filter-link-active"
                                    >
                                        Defecto
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a
                                        href="#"
                                        class="filter-link stext-106 trans-04"
                                    >
                                        Nombre
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a
                                        href="#"
                                        class="filter-link stext-106 trans-04"
                                    >
                                        Precio mayor
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a
                                        href="#"
                                        class="filter-link stext-106 trans-04"
                                    >
                                        Precio menor
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-3">
                            <div class="mtext-102 cl2 p-b-15">Precio</div>

                            <ul>
                                <li class="p-b-6">
                                    <a
                                        href="#"
                                        class="filter-link stext-106 trans-04 filter-link-active"
                                    >
                                        Todos
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a
                                        href="#"
                                        class="filter-link stext-106 trans-04"
                                    >
                                        $0.00 - $50.00
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a
                                        href="#"
                                        class="filter-link stext-106 trans-04"
                                    >
                                        $50.00 - $100.00
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a
                                        href="#"
                                        class="filter-link stext-106 trans-04"
                                    >
                                        $100.00 - $150.00
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a
                                        href="#"
                                        class="filter-link stext-106 trans-04"
                                    >
                                        $150.00 - $200.00
                                    </a>
                                </li>

                                <li class="p-b-6">
                                    <a
                                        href="#"
                                        class="filter-link stext-106 trans-04"
                                    >
                                        $200.00+
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-6">
                            <div class="mtext-102 cl2 p-b-15">Catálogos</div>

                            <ul
                            class="filtro_catalogos"
                                :class="[
                                    listCatalogos.length > 5
                                        ? 'column-list'
                                        : '',
                                ]"
                            >
                                <li class="p-b-6">
                                    <a
                                        href="#"
                                        class="filter-link stext-106 trans-04 filter-link-active"
                                    >
                                        Todos
                                    </a>
                                </li>

                                <li class="p-b-6" v-for="item in listCatalogos">
                                    <a
                                        href="#"
                                        class="filter-link stext-106 trans-04"
                                    >
                                        <p>{{ item.nombre }}</p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row isotope-grid">
                <div
                    v-for="item in listProductos"
                    class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item"
                    :class="[item.catalogo ? 'c' + item.catalogo.id : '']"
                >
                    <!-- Block2 -->
                    <div class="block2">
                        <div class="block2-pic hov-img0">
                            <img :src="item.url_imagen" alt="IMG-PRODUCT" />

                            <button
                                class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04"
                                @click="showModalProducto(item.id)"
                            >
                                Ver producto
                            </button>
                        </div>

                        <div class="block2-txt flex-w flex-t p-t-14">
                            <div class="block2-txt-child1 flex-col-l">
                                <span
                                    class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"
                                >
                                    {{ item.nombre }}
                                </span>

                                <span class="stext-105 cl3">
                                    Bs. {{ item.precio }}
                                </span>
                            </div>

                            <div class="block2-txt-child2 flex-r p-t-3">
                                <button
                                    class="btn-addwish-b2 dis-block pos-relative js-addwish-b2 text-warning"
                                    @click="showModalProducto(item.id)"
                                >
                                    <i class="fa fa-cart-plus fa-lg"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Load more -->
            <div class="flex-c-m flex-w w-full p-t-45 p-b-45">
                <a
                    href="#"
                    class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04"
                >
                    Cargar más
                </a>
            </div>
        </div>
        <ModalProducto
            :id="id_seleccionado"
            :mostrar_modal="muestra_modal_producto"
            @close="muestra_modal_producto = false"
        ></ModalProducto>
    </section>
</template>
<script>
import ModalProducto from "./componentes/ModalProducto.vue";
export default {
    components: {
        ModalProducto,
    },
    data() {
        return {
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            url_asset: "",
            listCatalogos: [],
            listProductos: [],
            id_seleccionado: 0,
            muestra_modal_producto: false,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getUrlAsset();
        this.getProductos();
        this.getCatalogos();
    },
    methods: {
        getUrlAsset() {
            axios.get(main_url + "/url_asset").then((response) => {
                this.url_asset = response.data;
            });
        },
        getProductos() {
            axios.get(main_url + "/portal/listaProductos").then((response) => {
                this.listProductos = response.data.productos;
                let self = this;
                setTimeout(function () {
                    self.metodosProductos();
                }, 300);
            });
        },
        getCatalogos() {
            axios.get(main_url + "/portal/getCatalogos").then((response) => {
                this.listCatalogos = response.data.catalogos;
            });
        },
        showModalProducto(id) {
            this.id_seleccionado = id;
            this.muestra_modal_producto = true;
        },

        metodosProductos() {
            /*==================================================================
            [ Filter / Search product ]*/
            $(".js-show-filter").on("click", function () {
                $(this).toggleClass("show-filter");
                $(".panel-filter").slideToggle(400);

                if ($(".js-show-search").hasClass("show-search")) {
                    $(".js-show-search").removeClass("show-search");
                    $(".panel-search").slideUp(400);
                }
            });

            $(".js-show-search").on("click", function () {
                $(this).toggleClass("show-search");
                $(".panel-search").slideToggle(400);
                $("#btnBuscarProducto").focus();

                if ($(".js-show-filter").hasClass("show-filter")) {
                    $(".js-show-filter").removeClass("show-filter");
                    $(".panel-filter").slideUp(400);
                }
            });
        },
    },
};
</script>
<style>
.contenedor_productos .block2-pic {
    height: 400px;
    overflow: hidden;
}
.contenedor_productos .block2-pic img {
    height: 100%;
    object-fit: cover;
}

.contenedor_productos .column-list {
    column-count: 2; /* Define el número de columnas deseado */
    column-gap: 20px;
}

.contenedor_productos .filtro_catalogos li a p {
    text-transform: lowercase;
}

.contenedor_productos .filtro_catalogos li a p:first-letter {
    text-transform: capitalize;
}
</style>
