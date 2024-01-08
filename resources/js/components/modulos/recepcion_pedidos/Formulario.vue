<template>
    <div class="row">
        <div class="form-group col-md-4" v-if="accion == 'nuevo'">
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
                v-model="recepcion_pedido.user_id"
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
        <div class="form-group col-md-4" v-else>
            <label
                :class="{
                    'text-danger': errors.user_id,
                }"
                >Taller*</label
            >
            <el-input
                v-if="recepcion_pedido.user"
                placeholder="Seleccionar Taller"
                class="w-100"
                :class="{ 'is-invalid': errors.user_id }"
                v-model="recepcion_pedido.user.full_name"
                readonly
            >
            </el-input>
            <span
                class="error invalid-feedback"
                v-if="errors.user_id"
                v-text="errors.user_id[0]"
            ></span>
        </div>
        <div class="form-group col-md-4" v-if="accion == 'nuevo'">
            <label
                :class="{
                    'text-danger': errors.distribucion_pedido_id,
                }"
                >Seleccionar Código de Pedido*</label
            >
            <el-select
                placeholder="Seleccionar Código de Pedido"
                class="w-100"
                :class="{ 'is-invalid': errors.distribucion_pedido_id }"
                v-model="recepcion_pedido.distribucion_pedido_id"
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
        <div class="form-group col-md-4" v-else>
            <label
                :class="{
                    'text-danger': errors.distribucion_pedido_id,
                }"
                >Código de Pedido*</label
            >
            <el-input
                v-if="recepcion_pedido.solicitud_pedido"
                placeholder="Seleccionar Código de Pedido"
                class="w-100"
                :class="{ 'is-invalid': errors.distribucion_pedido_id }"
                v-model="recepcion_pedido.solicitud_pedido.codigo"
                readonly
            >
            </el-input>
            <span
                class="error invalid-feedback"
                v-if="errors.distribucion_pedido_id"
                v-text="errors.distribucion_pedido_id[0]"
            ></span>
        </div>
        <div class="form-group col-md-4">
            <label
                :class="{
                    'text-danger': errors.fecha_recepcion,
                }"
                >Fecha de Recepción*</label
            >
            <input
                type="date"
                placeholder="Fecha de Recepción"
                class="form-control"
                :class="{ 'is-invalid': errors.fecha_recepcion }"
                v-model="recepcion_pedido.fecha_recepcion"
                clearable
            />
            <span
                class="error invalid-feedback"
                v-if="errors.fecha_recepcion"
                v-text="errors.fecha_recepcion[0]"
            ></span>
        </div>
        <div class="col-md-12">
            <hr />
            <h4 class="w-100 text-center">Productos</h4>
        </div>
        <div class="col-md-12" style="overflow: auto">
            <table class="table table-bordered table-striped">
                <thead class="bg-warning text-white">
                    <tr>
                        <th>Detalle Producto</th>
                        <th>Asignado</th>
                        <th>Recepción</th>
                    </tr>
                </thead>
                <tbody>
                    <template
                        v-if="recepcion_pedido.recepcion_detalles.length > 0"
                    >
                        <template
                            v-for="(
                                item, index
                            ) in recepcion_pedido.recepcion_detalles"
                        >
                            <tr>
                                <td rowspan="2">
                                    <div class="descripcion_producto">
                                        <div class="desc codigo">
                                            <strong>Código: </strong
                                            ><span>{{
                                                item.solicitud_detalle.codigo
                                            }}</span>
                                        </div>
                                        <div class="desc descripcion">
                                            <strong>Descripción: </strong
                                            ><span>{{
                                                item.solicitud_detalle
                                                    .descripcion
                                            }}</span>
                                        </div>
                                        <div class="desc talla">
                                            <strong>Talla: </strong
                                            ><span>{{
                                                item.solicitud_detalle.talla
                                            }}</span>
                                        </div>
                                        <div class="desc cantidad">
                                            <strong>Cantidad: </strong
                                            ><span
                                                class="badge badge-primary text-md"
                                                >{{
                                                    item.solicitud_detalle
                                                        .cantidad
                                                }}</span
                                            >
                                        </div>
                                        <div class="desc elaborado">
                                            <strong>Elaborado: </strong
                                            ><span>{{
                                                item.solicitud_detalle.elaborado
                                            }}</span>
                                        </div>
                                        <div class="desc titulo">
                                            <strong>Título: </strong
                                            ><span>{{
                                                item.solicitud_detalle.titulo
                                            }}</span>
                                        </div>
                                        <div class="desc codigo_color">
                                            <strong>Color Código: </strong
                                            ><span>{{
                                                item.solicitud_detalle
                                                    .codigo_color
                                            }}</span>
                                        </div>
                                        <div class="desc peso">
                                            <strong>Peso: </strong
                                            ><span
                                                class="badge badge-info text-md"
                                                >{{
                                                    item.solicitud_detalle.peso
                                                }}</span
                                            >
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <strong>Cantidad: </strong>
                                    <span class="badge badge-primary text-md">{{
                                        item.cantidad_asignada
                                    }}</span>
                                </td>
                                <td>
                                    <input
                                        type="number"
                                        step="0.01"
                                        class="form-control"
                                        :class="{
                                            'is-invalid':
                                                errors['cantidad_' + index],
                                        }"
                                        v-model="item.cantidad"
                                    />
                                    <span
                                        class="error invalid-feedback"
                                        v-if="errors['cantidad_' + index]"
                                        v-text="errors['cantidad_' + index][0]"
                                    ></span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Peso: </strong>
                                    <span class="badge badge-info text-md">{{
                                        item.peso_asignada
                                    }}</span>
                                </td>
                                <td>
                                    <input
                                        type="number"
                                        step="0.01"
                                        class="form-control"
                                        :class="{
                                            'is-invalid':
                                                errors['peso_' + index],
                                        }"
                                        v-model="item.peso"
                                    />
                                    <span
                                        class="error invalid-feedback"
                                        v-if="errors['peso_' + index]"
                                        v-text="errors['peso_' + index][0]"
                                    ></span>
                                </td>
                            </tr>
                        </template>
                    </template>
                    <template v-else>
                        <tr>
                            <td colspan="3" class="text-center">
                                NO SE ENCONTRARÓN PRODUCTOS
                            </td>
                        </tr>
                    </template>
                    <template></template>
                </tbody>
            </table>
        </div>
        <div class="col-md-4">
            <button
                class="btn btn-flat btn-block btn-warning"
                v-html="txtBtn"
                :disabled="enviando"
                @click="enviarFormulario"
            ></button>
        </div>
        <div class="col-md-2 text-center">
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
export default {
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
            },
        },
    },
    computed: {
        txtBtn() {
            if (this.enviando) {
                return `<i class="fa fa-spinner fa-spin"></i> Enviando...`;
            }
            if (this.accion == "nuevo") {
                return `<i class="fa fa-save"></i> Registrar Ditribución`;
            }
            if (this.accion == "edit") {
                return `<i class="fa fa-edit"></i> Actualizar Ditribución`;
            }
        },
    },
    watch: {
        accion(newVal) {
            if (newVal == "nuevo") {
                this.recepcion_pedido.fecha_recepcion = this.getFechaActual();
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
            this.recepcion_pedido.fecha_recepcion = this.getFechaActual();
        }
        this.getUsersSocios();
    },
    data() {
        return {
            enviando: false,
            errors: [],
            listDistribucionPedidos: [],
            listUsers: [],
        };
    },
    methods: {
        getDistribucionPedidosByUser() {
            if (this.recepcion_pedido.user_id != "") {
                axios
                    .get(main_url + "/admin/distribucion_pedidos/byUser", {
                        params: {
                            user_id: this.recepcion_pedido.user_id,
                        },
                    })
                    .then((response) => {
                        this.listDistribucionPedidos =
                            response.data.distribucion_pedidos;
                    });
            } else {
                this.listDistribucionPedidos = [];
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
            this.recepcion_pedido.recepcion_detalles = [];

            if (this.recepcion_pedido.distribucion_pedido_id != "") {
                axios
                    .get(
                        main_url +
                            "/admin/distribucion_pedidos/" +
                            this.recepcion_pedido.distribucion_pedido_id
                    )
                    .then((response) => {
                        const distribucion_detalles =
                            response.data.distribucion_pedido
                                .distribucion_detalles;
                        distribucion_detalles.forEach((elem) => {
                            this.recepcion_pedido.recepcion_detalles.push({
                                id: 0,
                                recepcion_pedido_id: 0,
                                solicitud_detalle_id: elem.solicitud_detalle_id,
                                cantidad: 0,
                                peso: 0,
                                cantidad_asignada: elem.cantidad,
                                peso_asignada: elem.peso,
                                solicitud_detalle: elem.solicitud_detalle,
                            });
                        });
                    });
            }
        },
        enviarFormulario() {
            this.enviando = true;
            try {
                let url = main_url + "/admin/recepcion_pedidos";
                if (this.accion == "edit") {
                    url =
                        main_url +
                        "/admin/recepcion_pedidos/" +
                        this.recepcion_pedido.id;
                    this.recepcion_pedido["_method"] = "put";
                }
                axios
                    .post(url, this.recepcion_pedido)
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
