<template>
    <div class="row">
        <div class="form-group col-md-4">
            <label
                :class="{
                    'text-danger': errors.solicitud_pedido_id,
                }"
                >Seleccionar Código de Pedido*</label
            >
            <el-select
                placeholder="Seleccionar Código de Pedido"
                class="w-100"
                :class="{ 'is-invalid': errors.solicitud_pedido_id }"
                v-model="distribucion_pedido.solicitud_pedido_id"
                clearable
                filtereable
                @change="getSolicitudPedido"
            >
                <el-option
                    v-for="item in listSolicitudPedidos"
                    :key="item.id"
                    :value="item.id"
                    :label="item.codigo"
                >
                </el-option>
            </el-select>
            <span
                class="error invalid-feedback"
                v-if="errors.solicitud_pedido_id"
                v-text="errors.solicitud_pedido_id[0]"
            ></span>
        </div>
        <div class="form-group col-md-4">
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
                v-model="distribucion_pedido.user_id"
                clearable
                filtereable
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
        <div class="form-group col-md-4">
            <label
                :class="{
                    'text-danger': errors.fecha_distribucion,
                }"
                >Fecha de Distribución*</label
            >
            <input
                type="date"
                placeholder="Fecha de Distribución"
                class="form-control"
                :class="{ 'is-invalid': errors.fecha_distribucion }"
                v-model="distribucion_pedido.fecha_distribucion"
                clearable
            />
            <span
                class="error invalid-feedback"
                v-if="errors.fecha_distribucion"
                v-text="errors.fecha_distribucion[0]"
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
                        <th>Restante</th>
                        <th>Distribución</th>
                    </tr>
                </thead>
                <tbody>
                    <template
                        v-if="
                            distribucion_pedido.distribucion_detalles.length > 0
                        "
                    >
                        <template
                            v-for="(
                                item, index
                            ) in distribucion_pedido.distribucion_detalles"
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
                                    <strong>Cantidad Restante: </strong>
                                    <span class="badge badge-primary text-md">{{
                                        item.solicitud_detalle.cantidad_restante
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
                                        @change="calculaCantidadRestante(item)"
                                        @keyup="calculaCantidadRestante(item)"
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
                                    <strong>Peso Restante: </strong>
                                    <span class="badge badge-info text-md">{{
                                        item.solicitud_detalle.peso_restante
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
                                        @change="calculaPesoRestante(item)"
                                        @keyup="calculaPesoRestante(item)"
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
                            <td colspan="2" class="text-center">
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
                :to="{ name: 'distribucion_pedidos.index' }"
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
        distribucion_pedido: {
            type: Object,
            default: {
                id: 0,
                solicitud_pedido_id: "",
                user_id: "",
                fecha_distribucion: "",
                distribucion_detalles: [],
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
                this.distribucion_pedido.fecha_distribucion =
                    this.getFechaActual();
            }
        },
    },
    mounted() {
        if (this.accion == "nuevo") {
            this.distribucion_pedido.fecha_distribucion = this.getFechaActual();
        }
        this.getSolicitudPedidos();
        this.getUsersSocios();
    },
    data() {
        return {
            enviando: false,
            errors: [],
            listSolicitudPedidos: [],
            listUsers: [],
        };
    },
    methods: {
        getSolicitudPedidos() {
            axios
                .get(main_url + "/admin/solicitud_pedidos")
                .then((response) => {
                    this.listSolicitudPedidos = response.data.solicitud_pedidos;
                });
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
        getSolicitudPedido() {
            this.distribucion_pedido.distribucion_detalles = [];

            if (this.distribucion_pedido.solicitud_pedido_id != "") {
                axios
                    .get(
                        main_url +
                            "/admin/solicitud_pedidos/" +
                            this.distribucion_pedido.solicitud_pedido_id
                    )
                    .then((response) => {
                        const solicitud_detalles =
                            response.data.solicitud_pedido.solicitud_detalles;
                        solicitud_detalles.forEach((elem) => {
                            this.distribucion_pedido.distribucion_detalles.push(
                                {
                                    id: 0,
                                    distribucion_pedido_id: 0,
                                    solicitud_detalle_id: elem.id,
                                    cantidad: 0,
                                    peso: 0,
                                    solicitud_detalle: elem,
                                }
                            );
                        });
                    });
            }
        },
        enviarFormulario() {
            this.enviando = true;
            try {
                let url = main_url + "/admin/distribucion_pedidos";
                if (this.accion == "edit") {
                    url =
                        main_url +
                        "/admin/distribucion_pedidos/" +
                        this.distribucion_pedido.id;
                    this.distribucion_pedido["_method"] = "put";
                }
                axios
                    .post(url, this.distribucion_pedido)
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
                            name: "distribucion_pedidos.index",
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
        calculaCantidadRestante(item) {
            let restante = item.solicitud_detalle.cantidad_restante_aux;
            if (this.accion == "edit") {
                restante += parseFloat(item.cantidad_aux);
            }
            if (item.cantidad <= restante) {
                item.solicitud_detalle.cantidad_restante =
                    restante - item.cantidad;
            } else {
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    html: `La cantidad no puede superar al restante de: ${restante}`,
                    showConfirmButton: true,
                    confirmButtonColor: "#c57a40",
                    confirmButtonText: "Aceptar",
                });
                item.solicitud_detalle.cantidad_restante = 0;
                item.cantidad = restante;
            }
        },
        calculaPesoRestante(item) {
            let restante = item.solicitud_detalle.peso_restante_aux;
            if (this.accion == "edit") {
                restante += parseFloat(item.peso_aux);
            }
            if (item.peso <= restante) {
                item.solicitud_detalle.peso_restante = restante - item.peso;
            } else {
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    html: `El peso no puede superar al restante de: ${restante}`,
                    showConfirmButton: true,
                    confirmButtonColor: "#c57a40",
                    confirmButtonText: "Aceptar",
                });
                item.solicitud_detalle.peso_restante = 0;
                item.peso = restante;
            }
        },
    },
};
</script>
