<template>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div
                            class="form-group col-md-6"
                            v-if="accion == 'nuevo'"
                        >
                            <label
                                :class="{
                                    'text-danger': errors.user_id,
                                }"
                                >Seleccionar Taller*</label
                            >
                            <el-select
                                placeholder="Seleccionar Taller"
                                class="w-100"
                                :class="{ 'is-invalid': errors.user_id }"
                                v-model="oRecepcionPedido.user_id"
                                clearable
                                filtereable
                                @change="getDistribucionPedidosByUser"
                            >
                                <el-option
                                    v-for="item in listUsers"
                                    :key="item.id"
                                    :value="item.id"
                                    :label="item.full_name"
                                >
                                </el-option>
                            </el-select>
                            <span
                                class="error invalid-feedback"
                                v-if="errors.user_id"
                                v-text="errors.user_id[0]"
                            ></span>
                        </div>
                        <div class="form-group col-md-6" v-else>
                            <label
                                :class="{
                                    'text-danger': errors.user_id,
                                }"
                                >Taller*</label
                            >
                            <el-input
                                v-if="oRecepcionPedido.user"
                                placeholder="Seleccionar Taller"
                                class="w-100"
                                :class="{ 'is-invalid': errors.user_id }"
                                v-model="oRecepcionPedido.user.full_name"
                                readonly
                            >
                            </el-input>
                            <span
                                class="error invalid-feedback"
                                v-if="errors.user_id"
                                v-text="errors.user_id[0]"
                            ></span>
                        </div>
                        <div
                            class="form-group col-md-6"
                            v-if="accion == 'nuevo'"
                        >
                            <label
                                :class="{
                                    'text-danger':
                                        errors.distribucion_pedido_id,
                                }"
                                >Seleccionar Código de Pedido*</label
                            >
                            <el-select
                                placeholder="Seleccionar Código de Pedido"
                                class="w-100"
                                :class="{
                                    'is-invalid': errors.distribucion_pedido_id,
                                }"
                                v-model="
                                    oRecepcionPedido.distribucion_pedido_id
                                "
                                clearable
                                filtereable
                                @change="getDistribucionPedido"
                            >
                                <el-option
                                    v-for="item in listDistribucionPedidos"
                                    :key="item.id"
                                    :value="item.id"
                                    :label="item.solicitud_pedido.codigo"
                                >
                                </el-option>
                            </el-select>
                            <span
                                class="error invalid-feedback"
                                v-if="errors.distribucion_pedido_id"
                                v-text="errors.distribucion_pedido_id[0]"
                            ></span>
                        </div>
                        <div class="form-group col-md-6" v-else>
                            <label
                                :class="{
                                    'text-danger':
                                        errors.distribucion_pedido_id,
                                }"
                                >Código de Pedido*</label
                            >
                            <el-input
                                v-if="
                                    recepcion_pedido &&
                                    oRecepcionPedido.solicitud_pedido
                                "
                                placeholder="Seleccionar Código de Pedido"
                                class="w-100"
                                :class="{
                                    'is-invalid': errors.distribucion_pedido_id,
                                }"
                                v-model="
                                    oRecepcionPedido.solicitud_pedido.codigo
                                "
                                readonly
                            >
                            </el-input>
                            <span
                                class="error invalid-feedback"
                                v-if="errors.distribucion_pedido_id"
                                v-text="errors.distribucion_pedido_id[0]"
                            ></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12">
            <div class="row">
                <div class="col-md-12">
                    <hr />
                    <h4 class="w-100 text-center">Listado de Recepción</h4>
                </div>
            </div>
            <template v-if="oRecepcionPedido.historia_recepcions.length > 0">
                <HistoriaRecepcion
                    v-for="(
                        item_historia, index_historia
                    ) in oRecepcionPedido.historia_recepcions"
                    :key="index_historia"
                    :index="index_historia"
                    :accion="accion"
                    :errors="errors"
                    :historia_recepcion="item_historia"
                ></HistoriaRecepcion>
            </template>
            <div class="row" v-else>
                <div class="col-12 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="text-center">
                                NO SE ENCONTRÓ NINGUN REGISTRO
                            </h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4 form-group">
            <button
                class="btn btn-flat btn-block btn-warning"
                v-html="txtBtn"
                :disabled="enviando"
                @click="enviarFormulario"
            ></button>
        </div>
        <div class="col-md-2 form-group text-center">
            <router-link
                :to="{ name: 'recepcion_pedidos.index' }"
                class="btn btn-default btn-block btn-flat"
            >
                <i class="fa fa-arrow-left"></i> Volver
            </router-link>
        </div>
    </div>
</template>
<script>
import HistoriaRecepcion from "./HistoriaRecepcion.vue";
export default {
    components: {
        HistoriaRecepcion,
    },
    props: {
        accion: {
            type: String,
            default: "nuevo",
        },
        recepcion_pedido: {
            type: Object,
            default: {
                id: 0,
                user_id: "",
                solicitud_pedido_id: "",
                distribucion_pedido_id: "",
                fecha_recepcion: "",
                recepcion_detalles: [],
                historia_recepcions: [],
            },
        },
    },
    computed: {
        txtBtn() {
            if (this.enviando) {
                return `<i class="fa fa-spinner fa-spin"></i> Enviando...`;
            }
            if (this.accion == "nuevo") {
                return `<i class="fa fa-save"></i> Registrar Recepción`;
            }
            if (this.accion == "edit") {
                return `<i class="fa fa-edit"></i> Actualizar Recepción`;
            }
        },
    },
    watch: {
        accion(newVal) {
            if (newVal == "nuevo") {
                this.oRecepcionPedido.fecha_recepcion = this.getFechaActual();
            } else {
                this.getDistribucionPedidosByUser();
            }
        },
        recepcion_pedido(newval) {
            this.getDistribucionPedidosByUser();
        },
    },
    mounted() {
        if (this.accion == "nuevo") {
            this.oRecepcionPedido.fecha_recepcion = this.getFechaActual();
        }
        this.getUsersSocios();
    },
    data() {
        return {
            enviando: false,
            errors: {},
            listDistribucionPedidos: [],
            listUsers: [],
            oRecepcionPedido: this.recepcion_pedido,
        };
    },
    methods: {
        getDistribucionPedidosByUser() {
            if (this.oRecepcionPedido.user_id != "") {
                axios
                    .get(main_url + "/admin/distribucion_pedidos/byUser", {
                        params: {
                            user_id: this.oRecepcionPedido.user_id,
                        },
                    })
                    .then((response) => {
                        this.listDistribucionPedidos =
                            response.data.distribucion_pedidos;

                        if (this.listDistribucionPedidos.length <= 0) {
                            this.oRecepcionPedido.distribucion_pedido_id = "";
                            this.listDistribucionPedidos = [];
                            this.oRecepcionPedido.historia_recepcions = [];
                        }
                    });
            } else {
                this.oRecepcionPedido.distribucion_pedido_id = "";
                this.listDistribucionPedidos = [];
                this.oRecepcionPedido.historia_recepcions = [];
            }
        },
        getUsersSocios() {
            axios
                .get(main_url + "/admin/usuarios/getUsuarioTipoPersonal", {
                    params: {
                        tipo: "SOCIO",
                    },
                })
                .then((response) => {
                    this.listUsers = response.data;
                });
        },
        getDistribucionPedido() {
            this.oRecepcionPedido.recepcion_detalles = [];

            if (this.oRecepcionPedido.distribucion_pedido_id != "") {
                axios
                    .get(
                        main_url +
                            "/admin/distribucion_pedidos/verificaRecepcion/" +
                            this.oRecepcionPedido.distribucion_pedido_id
                    )
                    .then((response) => {
                        let existe_recepcion = response.data.existe_recepcion;
                        let historia_recepcion_detalles = [];

                        if (existe_recepcion == true) {
                            // si ya se comenzo con el registro de recepcion solo asignar los datos
                            this.oRecepcionPedido =
                                response.data.recepcion_pedido;
                            // agregar la historia

                            const recepcion_Detalles_detalles =
                                this.oRecepcionPedido.recepcion_detalles;
                            recepcion_Detalles_detalles.forEach((elem) => {
                                historia_recepcion_detalles.push({
                                    id: 0,
                                    historia_recepcion_id: 0,
                                    solicitud_pedido_id:
                                        elem.solicitud_detalle_id,
                                    cantidad: 0,
                                    cantidad_aux: 0,
                                    peso: 0,
                                    peso_aux: 0,
                                    solicitud_detalle: elem.solicitud_detalle,
                                    recepcion_detalle: {
                                        id: 0,
                                        recepcion_pedido_id: 0,
                                        solicitud_detalle_id:
                                            elem.solicitud_detalle_id,
                                        cantidad: elem.cantidad,
                                        cantidad_restante:
                                            elem.cantidad_restante,
                                        cantidad_res_aux: elem.cantidad_res_aux,
                                        peso: elem.peso,
                                        peso_restante: elem.peso_restante,
                                        peso_res_aux: elem.peso_res_aux,
                                    },
                                });
                            });

                            this.oRecepcionPedido.historia_recepcions.unshift({
                                id: 0,
                                recepcion_pedido_id: this.oRecepcionPedido.id,
                                user_id: this.oRecepcionPedido.user_id,
                                solicitud_pedido_id:
                                    this.oRecepcionPedido.solicitud_pedido_id,
                                distribucion_pedido_id:
                                    this.oRecepcionPedido
                                        .distribucion_pedido_id,
                                cantidad: 0,
                                peso: 0,
                                fecha: "",
                                historia_recepcion_detalles:
                                    historia_recepcion_detalles,
                            });
                        } else {
                            // se debe inicializar la recepcion
                            this.oRecepcionPedido.user_id =
                                response.data.distribucion_pedido.user_id;
                            this.oRecepcionPedido.solicitud_pedido_id =
                                response.data.distribucion_pedido.solicitud_pedido_id;
                            this.oRecepcionPedido.distribucion_pedido_id =
                                response.data.distribucion_pedido.id;
                            // armar la historia
                            const distribucion_detalles =
                                response.data.distribucion_pedido
                                    .distribucion_detalles;
                            distribucion_detalles.forEach((elem) => {
                                historia_recepcion_detalles.push({
                                    id: 0,
                                    historia_recepcion_id: 0,
                                    solicitud_pedido_id:
                                        elem.solicitud_detalle_id,
                                    cantidad: 0,
                                    cantidad_aux: 0,
                                    peso: 0,
                                    peso_aux: 0,
                                    solicitud_detalle: elem.solicitud_detalle,
                                    recepcion_detalle: {
                                        id: 0,
                                        recepcion_pedido_id: 0,
                                        solicitud_detalle_id:
                                            elem.solicitud_detalle_id,
                                        cantidad: elem.cantidad,
                                        cantidad_restante: elem.cantidad,
                                        cantidad_res_aux: elem.cantidad,
                                        peso: elem.peso,
                                        peso_res_aux: elem.peso,
                                        peso_restante: elem.peso,
                                    },
                                });
                            });

                            this.oRecepcionPedido.historia_recepcions.push({
                                id: 0,
                                recepcion_pedido_id: 0,
                                user_id: this.oRecepcionPedido.user_id,
                                solicitud_pedido_id:
                                    this.oRecepcionPedido.solicitud_pedido_id,
                                distribucion_pedido_id:
                                    this.oRecepcionPedido
                                        .distribucion_pedido_id,
                                cantidad: 0,
                                peso: 0,
                                fecha: "",
                                historia_recepcion_detalles:
                                    historia_recepcion_detalles,
                            });
                        }
                    });
            }
        },
        enviarFormulario() {
            this.errors = [];
            this.enviando = true;
            try {
                let url = main_url + "/admin/recepcion_pedidos";
                if (this.accion == "edit") {
                    url =
                        main_url +
                        "/admin/recepcion_pedidos/" +
                        this.oRecepcionPedido.id;
                    this.oRecepcionPedido["_method"] = "put";
                }
                axios
                    .post(url, this.oRecepcionPedido)
                    .then((res) => {
                        this.enviando = false;
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        this.errors = [];
                        this.$router.push({
                            name: "recepcion_pedidos.index",
                        });
                    })
                    .catch((error) => {
                        this.enviando = false;
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
    },
};
</script>
