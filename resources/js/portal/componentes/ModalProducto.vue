<template>
    <!-- Modal1 -->
    <div
        class="wrap-modal1 js-modal1 p-t-60 p-b-20"
        :class="[muestra ? 'show-modal1' : '']"
    >
        <div class="overlay-modal1 js-hide-modal1" @click="cerrar"></div>

        <div class="container">
            <div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
                <button
                    class="how-pos3 hov3 trans-04 js-hide-modal1"
                    @click="cerrar"
                >
                    <img src="images/icons/icon-close.png" alt="CLOSE" />
                </button>

                <div class="row" v-if="oProducto && oProducto.id != 0">
                    <div class="col-md-6 col-lg-7 p-b-30">
                        <div class="p-l-25 p-r-30 p-lr-0-lg">
                            <div class="wrap-slick3 flex-sb flex-w">
                                <div class="gallery-lb">
                                    <div
                                        class="item-slick3"
                                        :data-thumb="oProducto.url_imagen"
                                    >
                                        <div class="wrap-pic-w pos-relative">
                                            <img
                                                :src="oProducto.url_imagen"
                                                alt="IMG-PRODUCT"
                                            />

                                            <!-- <a
                                                class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
                                                :href="oProducto.url_imagen"
                                            >
                                                <i class="fa fa-expand"></i>
                                            </a> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-5 p-b-30">
                        <div class="p-r-50 p-t-5 p-lr-0-lg">
                            <h4 class="mtext-105 cl2 js-name-detail p-b-14">
                                {{ oProducto.nombre }}
                            </h4>

                            <span class="mtext-106 cl2">
                                Bs. {{ oProducto.precio }}
                            </span>

                            <p class="stext-102 cl3 p-t-23">
                                {{ oProducto.descripcion }}
                            </p>

                            <!--  -->
                            <div class="p-t-33">
                                <div class="flex-w flex-r-m p-b-10">
                                    <div
                                        class="size-204 flex-w flex-m respon6-next"
                                    >
                                        <div
                                            class="wrap-num-product flex-w m-r-20 m-tb-10"
                                        >
                                            <div
                                                class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m"
                                            >
                                                <i
                                                    class="fs-16 zmdi zmdi-minus"
                                                ></i>
                                            </div>

                                            <input
                                                class="mtext-104 cl3 txt-center num-product"
                                                type="number"
                                                name="num-product"
                                                value="1"
                                            />

                                            <div
                                                class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m"
                                            >
                                                <i
                                                    class="fs-16 zmdi zmdi-plus"
                                                ></i>
                                            </div>
                                        </div>

                                        <button
                                            class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"
                                        >
                                            Añadir al carrito
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" v-else>
                    <div class="col-md-12">
                        <h4 class="w-100 text-center">
                            CARGANDO PRODUCTO...
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props: ["id", "mostrar_modal"],
    data() {
        return {
            oProducto: {
                id: 0,
                nombre: "",
                descripcion: "",
                precio: "",
                cantidad_stock: "",
                url_imagen: "",
                catalogo: { nombre: "", descripcion: "" },
            },
            muestra: false,
        };
    },
    watch: {
        mostrar_modal(newVal) {
            this.muestra = newVal;
            if (this.id != 0) {
                this.getProducto();
            }
        },
    },
    mounted() {},
    methods: {
        getProducto() {
            axios
                .get(main_url + "/portal/getProducto/" + this.id)
                .then((response) => {
                    this.oProducto = response.data.producto;
                });
        },
        cerrar() {
            this.oProducto = {
                id: 0,
                nombre: "",
                descripcion: "",
                precio: "",
                cantidad_stock: "",
                url_imagen: "",
                catalogo: { nombre: "", descripcion: "" },
            };
            this.$emit("close");
        },
    },
};
</script>
