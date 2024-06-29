<template>
    <div
        class="modal fade"
        :class="{ show: bModal }"
        id="modal-default"
        aria-modal="true"
        role="dialog"
    >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-warning">
                    <h4 class="modal-title" v-text="tituloModal"></h4>
                    <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                        @click="cierraModal"
                    >
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label
                                    :class="{
                                        'text-danger': errors.admin_producto_id,
                                    }"
                                    >Seleccionar Producto*</label
                                >
                                <el-select
                                    placeholder="Seleccionar Producto"
                                    class="w-100"
                                    :class="{
                                        'is-invalid': errors.admin_producto_id,
                                    }"
                                    v-model="salida_producto.admin_producto_id"
                                    clearable
                                    filtereable
                                >
                                    <el-option
                                        v-for="item in listProductos"
                                        :key="item.id"
                                        :value="item.id"
                                        :label="item.full_name"
                                    ></el-option>
                                </el-select>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.admin_producto_id"
                                    v-text="errors.admin_producto_id[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.cantidad,
                                    }"
                                    >Cantidad (KG)*</label
                                >

                                <input
                                    type="number"
                                    step="0.01"
                                    placeholder="Cantidad (KG)"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.cantidad,
                                    }"
                                    v-model="salida_producto.cantidad"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.cantidad"
                                    v-text="errors.cantidad[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.cantidad_conos,
                                    }"
                                    >Cantidad Conos*</label
                                >

                                <input
                                    type="number"
                                    step="0.01"
                                    placeholder="Cantidad Conos"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.cantidad_conos,
                                    }"
                                    v-model="salida_producto.cantidad_conos"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.cantidad_conos"
                                    v-text="errors.cantidad_conos[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.fecha_salida,
                                    }"
                                    >Fecha Salida*</label
                                >

                                <input
                                    type="date"
                                    placeholder="Fecha Salida"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.fecha_salida,
                                    }"
                                    v-model="salida_producto.fecha_salida"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.fecha_salida"
                                    v-text="errors.fecha_salida[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.user_id,
                                    }"
                                    >Seleccionar Socio</label
                                >
                                <el-select
                                    placeholder="Seleccionar Socio"
                                    class="w-100"
                                    :class="{
                                        'is-invalid': errors.user_id,
                                    }"
                                    v-model="salida_producto.user_id"
                                    clearable
                                    filtereable
                                    @change="getSolicitudPedidos"
                                >
                                    <el-option
                                        v-for="item in listUsersSocios"
                                        :key="item.id"
                                        :value="item.id"
                                        :label="item.full_name"
                                    ></el-option>
                                </el-select>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.user_id"
                                    v-text="errors.user_id[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger':
                                            errors.solicitud_pedido_id,
                                    }"
                                    >Seleccionar Cód. Solicitud Pedido</label
                                >
                                <el-select
                                    placeholder="Seleccionar Cód. Solicitud Pedido"
                                    class="w-100"
                                    :class="{
                                        'is-invalid':
                                            errors.solicitud_pedido_id,
                                    }"
                                    v-model="
                                        salida_producto.solicitud_pedido_id
                                    "
                                    clearable
                                    filtereable
                                >
                                    <el-option
                                        v-for="item in listSolicitudPedidos"
                                        :key="item.id"
                                        :value="item.id"
                                        :label="item.codigo"
                                    ></el-option>
                                </el-select>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.solicitud_pedido_id"
                                    v-text="errors.solicitud_pedido_id[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.detalle,
                                    }"
                                    >Otro(Escribir Detalle)</label
                                >

                                <el-input
                                    type="textarea"
                                    autosize
                                    placeholder="Validez del Credencial"
                                    :class="{
                                        'is-invalid': errors.detalle,
                                    }"
                                    v-model="salida_producto.detalle"
                                    clearable
                                ></el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.detalle"
                                    v-text="errors.detalle[0]"
                                ></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer justify-content-between">
                    <button
                        type="button"
                        class="btn btn-default"
                        data-dismiss="modal"
                        @click="cierraModal"
                    >
                        Cerrar
                    </button>
                    <el-button
                        type="warning"
                        class="bg-warning"
                        :loading="enviando"
                        @click="setRegistroModal()"
                        >{{ textoBoton }}</el-button
                    >
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        muestra_modal: {
            type: Boolean,
            default: false,
        },
        accion: {
            type: String,
            default: "nuevo",
        },
        salida_producto: {
            type: Object,
            default: {
                admin_producto_id: "",
                cantidad: "",
                cantidad_conos: "",
                fecha_salida: "",
                user_id: "",
                solicitud_pedido_id: "",
                detalle: "",
            },
        },
    },
    watch: {
        muestra_modal: function (newVal, oldVal) {
            this.errors = [];
            if (newVal) {
                if (this.accion != "edit") {
                    this.salida_producto.fecha_salida = this.getFechaActual();
                }
                this.bModal = true;
            } else {
                this.bModal = false;
            }
        },
    },
    computed: {
        tituloModal() {
            if (this.accion == "nuevo") {
                return "AGREGAR REGISTRO";
            } else {
                return "MODIFICAR REGISTRO";
            }
        },
        textoBoton() {
            if (this.accion == "nuevo") {
                return "Registrar";
            } else {
                return "Actualizar";
            }
        },
    },
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            bModal: this.muestra_modal,
            enviando: false,
            errors: [],
            listProductos: [],
            listUsersSocios: [],
            listSolicitudPedidos: [],
        };
    },
    mounted() {
        this.bModal = this.muestra_modal;
        this.getProductos();
        this.getUserSocios();
        this.getSolicitudPedidos();
    },
    methods: {
        getSolicitudPedidos() {
            this.listSolicitudPedidos = [];
            axios
                .get(main_url + "/admin/solicitud_pedidos", {
                    params: {
                        user_id: this.salida_producto.user_id,
                    },
                })
                .then((response) => {
                    this.listSolicitudPedidos = response.data.solicitud_pedidos;
                });
        },
        getUserSocios() {
            axios
                .get(main_url + "/admin/usuarios/getUsuarioTipoPersonal", {
                    params: {
                        tipo: "SOCIO",
                    },
                })
                .then((response) => {
                    this.listUsersSocios = response.data;
                });
        },
        getProductos() {
            axios.get(main_url + "/admin/admin_productos").then((response) => {
                this.listProductos = response.data.admin_productos;
            });
        },
        setRegistroModal() {
            this.enviando = true;
            try {
                this.textoBtn = "Enviando...";
                let url = main_url + "/admin/salida_productos";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "admin_producto_id",
                    this.salida_producto.admin_producto_id
                        ? this.salida_producto.admin_producto_id
                        : ""
                );
                formdata.append(
                    "cantidad",
                    this.salida_producto.cantidad
                        ? this.salida_producto.cantidad
                        : ""
                );
                formdata.append(
                    "cantidad_conos",
                    this.salida_producto.cantidad_conos
                        ? this.salida_producto.cantidad_conos
                        : ""
                );
                formdata.append(
                    "tipo_registro",
                    this.salida_producto.tipo_registro
                        ? this.salida_producto.tipo_registro
                        : ""
                );
                formdata.append(
                    "user_id",
                    this.salida_producto.user_id
                        ? this.salida_producto.user_id
                        : ""
                );
                formdata.append(
                    "solicitud_pedido_id",
                    this.salida_producto.solicitud_pedido_id
                        ? this.salida_producto.solicitud_pedido_id
                        : ""
                );
                formdata.append(
                    "detalle",
                    this.salida_producto.detalle
                        ? this.salida_producto.detalle
                        : ""
                );
                formdata.append(
                    "fecha_salida",
                    this.salida_producto.fecha_salida
                        ? this.salida_producto.fecha_salida
                        : ""
                );

                if (this.accion == "edit") {
                    url =
                        main_url +
                        "/admin/salida_productos/" +
                        this.salida_producto.id;
                    formdata.append("_method", "PUT");
                }
                axios
                    .post(url, formdata, config)
                    .then((res) => {
                        this.enviando = false;
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        this.limpiaSalidaProducto();
                        this.$emit("envioModal");
                        this.errors = [];
                        if (this.accion == "edit") {
                            this.textoBtn = "Actualizar";
                        } else {
                            this.textoBtn = "Registrar";
                        }
                    })
                    .catch((error) => {
                        this.enviando = false;
                        if (this.accion == "edit") {
                            this.textoBtn = "Actualizar";
                        } else {
                            this.textoBtn = "Registrar";
                        }
                        if (error.response) {
                            if (error.response.status === 422) {
                                this.errors = error.response.data.errors;
                            }
                            if (
                                error.response.status === 420 ||
                                error.response.status === 419 ||
                                error.response.status === 401
                            ) {
                                window.location = "/";
                            }
                            if (error.response.status === 500) {
                                Swal.fire({
                                    icon: "error",
                                    title: "Error",
                                    html: error.response.data.message,
                                    showConfirmButton: true,
                                    confirmButtonColor: "#c57a40",
                                    confirmButtonText: "Aceptar",
                                });
                            }
                        }
                    });
            } catch (e) {
                this.enviando = false;
                console.log(e);
            }
        },
        cargaImagen(e) {
            this.salida_producto.foto = e.target.files[0];
        },
        // Dialog/modal
        cierraModal() {
            this.bModal = false;
            this.$emit("close");
        },
        limpiaSalidaProducto() {
            this.errors = [];
            this.salida_producto.admin_producto_id = "";
            this.salida_producto.cantidad = "";
            this.salida_producto.cantidad_conos = "";
            this.salida_producto.tipo_registro = "";
            this.salida_producto.user_id = "";
            this.salida_producto.solicitud_pedido_id = "";
            this.salida_producto.detalle = "";
            this.salida_producto.fecha_salida = "";
        },
    },
};
</script>

<style></style>
