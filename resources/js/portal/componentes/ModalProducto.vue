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
                            <div class="wrap-slick3 d-block bg-dark">
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

                                            <a
                                                class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
                                                :href="oProducto.url_imagen"
                                            >
                                                <i class="fa fa-expand"></i>
                                            </a>
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

                            <p class="stext-104 cl3 p-t-23">
                                <strong>Stock actual: </strong
                                ><span class="mtext-106">{{
                                    oProducto.cantidad_stock
                                }}</span>
                            </p>

                            <p class="stext-102 cl3 p-t-23">
                                {{ oProducto.descripcion }}
                            </p>

                            <!--  -->
                            <div class="p-t-33">
                                <div class="contenedor_agregar_carrito">
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
                                            min="1"
                                            value="1"
                                            ref="input_cantidad"
                                        />

                                        <div
                                            class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m"
                                        >
                                            <i class="fs-16 zmdi zmdi-plus"></i>
                                        </div>
                                    </div>

                                    <button
                                        class="stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"
                                        @click="agregarCarrito"
                                    >
                                        Añadir al carrito
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" v-else>
                    <div class="col-md-12">
                        <h4 class="w-100 text-center">CARGANDO PRODUCTO...</h4>
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
                    let self = this;
                    setTimeout(function () {
                        self.initSlick3();
                        self.initContador();
                    }, 500);
                });
        },
        agregarCarrito() {
            if (this.$refs.input_cantidad.value > 0) {
                let carrito = [];
                if (localStorage.getItem("carrito_qhana")) {
                    carrito = JSON.parse(localStorage.getItem("carrito_qhana"));
                }
                let subtotal =
                    parseFloat(this.$refs.input_cantidad.value) *
                    parseFloat(this.oProducto.precio);
                subtotal = subtotal.toFixed(2);

                let cantidad_agregada = this.$refs.input_cantidad.value;

                if (cantidad_agregada > this.oProducto.cantidad_stock) {
                    cantidad_agregada = this.oProducto.cantidad_stock;
                }

                carrito.push({
                    producto_id: this.oProducto.id,
                    nombre: this.oProducto.nombre,
                    cantidad: cantidad_agregada,
                    subtotal: subtotal,
                    url_imagen: this.oProducto.url_imagen,
                    precio: this.oProducto.precio,
                });
                localStorage.setItem("carrito_qhana", JSON.stringify(carrito));
                this.$refs.input_cantidad.value = 1;
                EventBus.$emit("producto_agregado");
                this.cerrar();
                Swal.fire({
                    icon: "success",
                    title: "Correcto",
                    html: "Producto agregado correctamente",
                    showConfirmButton: false,
                    timer: 1500,
                });
            } else {
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    html: "La cantidad no debe ser menor a 1",
                    showConfirmButton: true,
                    confirmButtonColor: "#c57a40",
                    confirmButtonText: "Aceptar",
                });
            }
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
        initSlick3() {
            $(".wrap-slick3").each(function () {
                $(this).find(".slick3").slick({
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    fade: true,
                    infinite: true,
                    autoplay: false,
                    autoplaySpeed: 6000,
                });
            });

            // GALERIA
            $(".gallery-lb").each(function () {
                // the containers for all your galleries
                $(this).magnificPopup({
                    delegate: "a", // the selector for gallery item
                    type: "image",
                    gallery: {
                        enabled: true,
                    },
                    mainClass: "mfp-fade",
                });
            });
        },
        initContador() {
            let self = this;
            /*==================================================================
                [ +/- num product ]*/
            $(".btn-num-product-down")
                .off("click")
                .on("click", function () {
                    var numProduct = Number($(this).next().val());
                    if (numProduct > 1)
                        $(this)
                            .next()
                            .val(numProduct - 1);
                });

            // Desvincular los eventos de clic antes de adjuntar nuevos eventos
            $(".btn-num-product-up")
                .off("click")
                .on("click", function () {
                    var numProduct = Number($(this).prev().val());
                    if (numProduct < self.oProducto.cantidad_stock) {
                        $(this)
                            .prev()
                            .val(numProduct + 1);
                    }
                });
        },
    },
};
</script>
