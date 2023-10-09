<template>
    <!-- Blog -->
    <section class="sec-blog bg0 p-b-90 contenedor_actividades fondo_seccion">
        <div class="container-fluid p-0 mb-4">
            <div class="bg-dark">
                <h2
                    class="ltext-105 cl5 txt-center respon1 text-warning pt-3 pb-3"
                >
                    TÚ CARRITO
                </h2>
            </div>
        </div>
        <div class="container wow fadeInUp bg-dark pt-3" wow-data-delay="0.2s">
            <div class="row">
                <div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
                    <div class="m-l-25 m-r--38 m-lr-0-xl">
                        <div class="wrap-table-shopping-cart">
                            <table class="table-shopping-cart">
                                <tr class="table_head">
                                    <th class="column-1 text-dark bg-warning">
                                        Producto
                                    </th>
                                    <th
                                        class="column-2 text-dark bg-warning"
                                    ></th>
                                    <th class="column-3 text-dark bg-warning">
                                        Precio
                                    </th>
                                    <th
                                        class="column-4 text-dark bg-warning text-center"
                                    >
                                        Cantidad
                                    </th>
                                    <th class="column-5 text-dark bg-warning">
                                        Subtotal
                                    </th>
                                    <th
                                        class="column-6 text-dark bg-warning pr-1"
                                    >
                                        Acción
                                    </th>
                                </tr>

                                <template
                                    v-if="oPedido.detalle_pedidos.length > 0"
                                >
                                    <tr
                                        class="table_row"
                                        v-for="(
                                            item, index
                                        ) in oPedido.detalle_pedidos"
                                    >
                                        <td class="column-1 text-white">
                                            <div class="how-itemcart1">
                                                <img
                                                    :src="item.url_imagen"
                                                    alt="IMG"
                                                />
                                            </div>
                                        </td>
                                        <td class="column-2 text-white">
                                            {{ item.nombre }}
                                        </td>
                                        <td class="column-3 text-white">
                                            Bs. {{ item.precio }}
                                        </td>
                                        <td
                                            class="column-4 text-white text-center"
                                        >
                                            {{ item.cantidad }}
                                        </td>
                                        <td class="column-5 text-white">
                                            Bs. {{ item.subtotal }}
                                        </td>
                                        <td
                                            class="column-6 text-white text-right pr-1"
                                        >
                                            <button
                                                class="btn btn-danger"
                                                @click="eliminarProducto(index)"
                                            >
                                                <i class="fa fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </template>

                                <tr v-else>
                                    <td
                                        colspan="6"
                                        class="text-white text-center"
                                    >
                                        AÚN NO AGREGASTE NINGÚN PRODUCTO AL
                                        CARRITO
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
                    <div
                        class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm"
                    >
                        <h4 class="mtext-109 cl0 p-b-30 text-warning">
                            Confirmar pedido
                        </h4>

                        <div class="flex-w flex-t bor12 p-b-13">
                            <div class="size-208">
                                <span class="stext-110 cl0"> Total: </span>
                            </div>

                            <div class="size-209">
                                <span class="mtext-110 cl0">
                                    Bs. {{ oPedido.monto_total }}
                                </span>
                            </div>
                        </div>
                        <div class="row bor12 pt-2">
                            <div class="form-group col-md-12">
                                <label class="text-white">Nombres*</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.nombres,
                                    }"
                                    v-model="oPedido.nombres"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.nombres"
                                    v-text="errors.nombres[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-12">
                                <label class="text-white">Apellidos*</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.apellidos,
                                    }"
                                    v-model="oPedido.apellidos"
                                /><span
                                    class="error invalid-feedback"
                                    v-if="errors.apellidos"
                                    v-text="errors.apellidos[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-12">
                                <label class="text-white"
                                    >País/Estado/Ciudad*</label
                                >
                                <input
                                    type="text"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.pec,
                                    }"
                                    v-model="oPedido.pec"
                                /><span
                                    class="error invalid-feedback"
                                    v-if="errors.pec"
                                    v-text="errors.pec[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-12">
                                <label class="text-white"
                                    >Teléfono/Celular*</label
                                >
                                <input
                                    type="text"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.fono,
                                    }"
                                    v-model="oPedido.fono"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.fono"
                                    v-text="errors.fono[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-12">
                                <label class="text-white"
                                    >Correo electrónico</label
                                >
                                <input
                                    type="text"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.correo,
                                    }"
                                    v-model="oPedido.correo"
                                /><span
                                    class="error invalid-feedback"
                                    v-if="errors.correo"
                                    v-text="errors.correo[0]"
                                ></span>
                            </div>
                        </div>

                        <button
                            v-if="oPedido.detalle_pedidos.length > 0"
                            class="flex-c-m stext-101 cl2 size-116 bg8 bor14 hov-btn3 p-lr-15 trans-04 pointer mt-3"
                            @click="prepararEnvio()"
                            :disabled="enviando"
                            v-text="txtBoton"
                        ></button>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>
<script>
export default {
    data() {
        return {
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            oPedido: {
                nombres: "",
                apellidos: "",
                pec: "",
                correo: "",
                monto_total: "0.00",
                detalle_pedidos: [],
            },
            errors: [],
            enviando: false,
        };
    },
    computed: {
        txtBoton() {
            if (this.enviando) {
                return "ENVIANDO...";
            }
            return "FINALIZAR PEDIDO";
        },
    },
    mounted() {
        this.loadingWindow.close();
        this.getCarrito();
        $(".js-panel-cart").removeClass("show-header-cart");
        $(".js-sidebar").removeClass("show-sidebar");
    },
    methods: {
        getCarrito() {
            if (localStorage.getItem("carrito_qhana")) {
                this.oPedido.detalle_pedidos = JSON.parse(
                    localStorage.getItem("carrito_qhana")
                );
                this.cantidad_carrito = this.oPedido.detalle_pedidos.length;
            } else {
                this.cantidad_carrito;
            }
            this.getTotal();
        },
        getTotal() {
            if (localStorage.getItem("carrito_qhana")) {
                this.oPedido.detalle_pedidos = JSON.parse(
                    localStorage.getItem("carrito_qhana")
                );
                let sum_total = this.oPedido.detalle_pedidos.reduce(function (
                    acumulador,
                    objeto
                ) {
                    return acumulador + parseFloat(objeto.subtotal);
                },
                0);
                this.oPedido.monto_total = parseFloat(sum_total).toFixed(2);
            } else {
                this.oPedido.monto_total = "0.00";
            }
        },
        eliminarProducto(index) {
            let nombre = this.oPedido.detalle_pedidos[index].nombre;
            Swal.fire({
                title: "¿Quierés eliminar este producto del carrito?",
                html: `<strong>${nombre}</strong>`,
                showCancelButton: true,
                confirmButtonColor: "#c57a40",
                confirmButtonText: "Si, eliminar",
                cancelButtonText: "No, cancelar",
                denyButtonText: `No, cancelar`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    this.oPedido.detalle_pedidos.splice(index, 1);
                    localStorage.setItem(
                        "carrito_qhana",
                        JSON.stringify(this.oPedido.detalle_pedidos)
                    );
                    this.getCarrito();
                    EventBus.$emit("producto_agregado");
                }
            });
        },
        prepararEnvio() {
            this.enviando = true;
            let self = this;
            setTimeout(function () {
                self.enviarPedido();
            }, 500);
        },
        enviarPedido() {
            axios
                .post(main_url + "/portal/solicitudPedido", this.oPedido)
                .then((response) => {
                    Swal.fire({
                        icon: "success",
                        title: "¡Correcto!",
                        html: response.data.message,
                        showConfirmButton: false,
                        timer: 2000,
                    });
                    this.oPedido.detalle_pedidos = [];
                    localStorage.removeItem("carrito_qhana");
                    this.enviando = false;
                })
                .catch((error) => {
                    this.enviando = false;
                    if (error.response) {
                        if (error.response.status === 422) {
                            this.errors = error.response.data.errors;
                        }
                        if (error.response.status === 500) {
                            Swal.fire({
                                icon: "error",
                                title: "Error",
                                html: error.response.data.message,
                                showConfirmButton: false,
                                timer: 2000,
                            });
                        }
                    }
                });
        },
    },
};
</script>
<style></style>
