<template>
    <!-- Cart -->
    <div class="wrap-header-cart js-panel-cart">
        <div class="s-full js-hide-cart"></div>

        <div class="header-cart flex-col-l p-l-65 p-r-25">
            <div class="header-cart-title flex-w flex-sb-m p-b-8">
                <span class="mtext-103 cl2"> TÚ CARRITO </span>

                <div
                    class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart"
                >
                    <i class="zmdi zmdi-close"></i>
                </div>
            </div>

            <div class="header-cart-content flex-w js-pscroll">
                <ul
                    class="header-cart-wrapitem w-full"
                    v-if="carrito.length > 0"
                >
                    <li
                        v-for="item in carrito"
                        class="header-cart-item flex-w flex-t m-b-12"
                    >
                        <div class="header-cart-item-img">
                            <img :src="item.url_imagen" alt="IMG" />
                        </div>

                        <div class="header-cart-item-txt p-t-8">
                            <a
                                href="#"
                                class="header-cart-item-name m-b-18 hov-cl0 trans-04"
                            >
                                {{ item.nombre }}
                            </a>

                            <span class="header-cart-item-info">
                                {{ item.cantidad }} x Bs. {{ item.precio }}
                            </span>
                        </div>
                    </li>
                </ul>
                <div class="w-full text-center text-white" v-else>
                    AÚN NO AGREGASTE NINGÚN PRODUCTO AL CARRITO
                </div>

                <div class="w-full" v-if="carrito.length > 0">
                    <div class="header-cart-total w-full p-tb-40">
                        Total: Bs. {{ total }}
                    </div>

                    <div class="header-cart-buttons flex-w w-full">
                        <router-link
                            :to="{ name: 'portal.carrito' }"
                            class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10"
                        >
                            Ver carrito
                        </router-link>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            carrito: [],
            total: "0.00",
        };
    },
    mounted() {
        this.getCarrito();
        EventBus.$on("producto_agregado", () => {
            this.getCarrito();
        });
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
            this.getTotal();
        },
        getTotal() {
            if (localStorage.getItem("carrito_qhana")) {
                this.carrito = JSON.parse(
                    localStorage.getItem("carrito_qhana")
                );
                let sum_total = this.carrito.reduce(function (
                    acumulador,
                    objeto
                ) {
                    return acumulador + parseFloat(objeto.subtotal);
                },
                0);
                this.total = parseFloat(sum_total).toFixed(2);
            } else {
                this.total = "0.00";
            }
        },
    },
};
</script>
