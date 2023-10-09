<template>
    <div class="contenedor_inicio">
        <!-- Product -->
        <section class="sec-blog bg0 p-b-90 fondo_seccion">
            <div class="container-fluid p-0 mb-4">
                <div class="bg-dark">
                    <h1
                        class="ltext-105 cl5 txt-center respon1 text-warning pt-3 pb-3"
                    >
                        QHANA BOLIVIA
                    </h1>
                </div>
            </div>
            <div
                class="container bg-dark pt-3 pb-3 wow fadeInUp"
                data-wow-delay="0.1s"
            >
                <h4 class="cl11 txt-center respon1">
                    ÚLTIMOS PRODUCTOS AGREGADOS
                </h4>
                <!-- Tab01 -->
                <div class="tab01">
                    <!-- Nav tabs -->
                    <ul
                        class="nav nav-tabs"
                        role="tablist"
                        style="display: none"
                    >
                        <li class="nav-item p-b-10">
                            <a
                                class="nav-link active"
                                data-toggle="tab"
                                href="#best-seller"
                                role="tab"
                                >Best Seller</a
                            >
                        </li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <!-- - -->
                        <div
                            class="tab-pane fade show active"
                            id="best-seller"
                            role="tabpanel"
                        >
                            <!-- Slide2 -->
                            <div class="wrap-slick2">
                                <div class="slick2">
                                    <div
                                        class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15"
                                        v-for="item in listProductos"
                                    >
                                        <!-- Block2 -->
                                        <div class="block2">
                                            <div class="block2-pic hov-img0">
                                                <img
                                                    :src="item.url_imagen"
                                                    alt="IMG-PRODUCT"
                                                />

                                                <button
                                                    class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04"
                                                    @click="
                                                        showModalProducto(
                                                            item.id
                                                        )
                                                    "
                                                >
                                                    Ver producto
                                                </button>
                                                <span class="info_catalogo">
                                                    {{ item.catalogo.nombre }}
                                                </span>
                                            </div>

                                            <div
                                                class="block2-txt flex-w flex-t p-t-14"
                                            >
                                                <div
                                                    class="block2-txt-child1 flex-col-l"
                                                >
                                                    <span
                                                        class="stext-104 cl0 hov-cl1 trans-04 js-name-b2 p-b-6"
                                                    >
                                                        {{ item.nombre }}
                                                    </span>

                                                    <span
                                                        class="stext-105 cl12"
                                                    >
                                                        Bs. {{ item.precio }}
                                                    </span>
                                                </div>

                                                <div
                                                    class="block2-txt-child2 flex-r p-t-3"
                                                >
                                                    <button
                                                        class="btn-addwish-b2 dis-block pos-relative js-addwish-b2 text-warning"
                                                        @click="
                                                            showModalProducto(
                                                                item.id
                                                            )
                                                        "
                                                    >
                                                        <i
                                                            class="fa fa-cart-plus fa-lg"
                                                        ></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-5 ml-auto mr-auto">
                        <router-link
                            :to="{ name: 'portal.productos' }"
                            class="btn btn-block btn-warning"
                            >VER TODOS LOS PRODUCTOS</router-link
                        >
                    </div>
                </div>
            </div>
            <hr />
            <div
                class="container bg-dark pt-3 pb-3 wow slideInUp contenedor_actividades"
                data-wow-delay="0.1s"
            >
                <h4 class="cl11 txt-center respon1 mb-2">
                    NUESTRAS ACTIVIDADES
                </h4>
                <div class="container-fluid">
                    <div class="row">
                        <div
                            class="col-sm-6 col-md-4"
                            v-for="item in listActividads"
                        >
                            <div class="blog-item">
                                <div class="hov-img0">
                                    <router-link
                                        :to="{
                                            name: 'portal.actividad',
                                            params: { id: item.id },
                                        }"
                                    >
                                        <img
                                            :src="item.url_imagen"
                                            alt="IMG-ACTIIDAD"
                                        />
                                    </router-link>
                                </div>

                                <div class="p-t-15 descripcion_actividad">
                                    <!-- <h4 class="p-b-12">
                                <a
                                    href=""
                                    class="mtext-101 cl2 hov-cl1 trans-04"
                                >
                                    SOCIOS
                                </a>
                            </h4> -->

                                    <p
                                        class="stext-108 cl6"
                                        v-text="item.descripcion"
                                    ></p>
                                    <router-link
                                        :to="{
                                            name: 'portal.actividad',
                                            params: { id: item.id },
                                        }"
                                        class="btn btn-warning btn-xs btn-block mt-1"
                                    >
                                        Ver más
                                    </router-link>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-5 ml-auto mr-auto">
                            <router-link
                                :to="{ name: 'portal.actividads' }"
                                class="btn btn-block btn-warning"
                                >VER TODAS LAS ACTIVIDADES</router-link
                            >
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <ModalProducto
            :id="id_seleccionado"
            :mostrar_modal="muestra_modal_producto"
            @close="muestra_modal_producto = false"
        ></ModalProducto>
    </div>
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
            listProductos: [],
            listActividads: [],
            id_seleccionado: 0,
            muestra_modal_producto: false,
        };
    },
    mounted() {
        let self = this;
        setTimeout(function () {
            self.loadingWindow.close();
        }, 500);
        this.ultimosProductos();
        this.ultimasActividades();
    },
    methods: {
        ultimosProductos() {
            axios
                .get(main_url + "/portal/ultimosProductos")
                .then((response) => {
                    this.listProductos = response.data.productos;
                    let self = this;
                    setTimeout(function () {
                        self.initSlick2();
                    }, 300);
                });
        },
        ultimasActividades() {
            axios
                .get(main_url + "/portal/ultimasActividades")
                .then((response) => {
                    this.listActividads = response.data.actividads;
                });
        },
        initSlick2() {
            /*==================================================================
                [ Slick2 ]*/
            $(".wrap-slick2").each(function () {
                $(this)
                    .find(".slick2")
                    .slick({
                        slidesToShow: 4,
                        slidesToScroll: 4,
                        infinite: false,
                        autoplay: false,
                        autoplaySpeed: 6000,
                        arrows: true,
                        appendArrows: $(this),
                        prevArrow:
                            '<button class="arrow-slick2 prev-slick2"><i class="fa fa-angle-left" aria-hidden="true"></i></button>',
                        nextArrow:
                            '<button class="arrow-slick2 next-slick2"><i class="fa fa-angle-right" aria-hidden="true"></i></button>',
                        responsive: [
                            {
                                breakpoint: 1200,
                                settings: {
                                    slidesToShow: 4,
                                    slidesToScroll: 4,
                                },
                            },
                            {
                                breakpoint: 992,
                                settings: {
                                    slidesToShow: 3,
                                    slidesToScroll: 3,
                                },
                            },
                            {
                                breakpoint: 768,
                                settings: {
                                    slidesToShow: 2,
                                    slidesToScroll: 2,
                                },
                            },
                            {
                                breakpoint: 576,
                                settings: {
                                    slidesToShow: 1,
                                    slidesToScroll: 1,
                                },
                            },
                        ],
                    });
            });
        },

        showModalProducto(id) {
            this.id_seleccionado = id;
            this.muestra_modal_producto = true;
        },
    },
};
</script>
<style>
.contenedor_inicio .block2-pic {
    height: 334px;
    overflow: hidden;
}
.contenedor_inicio .block2-pic img {
    height: 100%;
    object-fit: cover;
}

.contenedor_inicio .info_catalogo {
    position: absolute;
    top: 0px;
    left: 0px;
    background-color: var(--secundario_transparent);
    padding: 7px;
    color: var(--principal);
    font-size: 0.75em;
}
</style>
