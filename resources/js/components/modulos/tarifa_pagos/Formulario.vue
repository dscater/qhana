<template>
    <div class="row">
        <div class="form-group col-md-6" v-if="accion == 'nuevo'">
            <label
                :class="{
                    'text-danger': errors.cliente_id,
                }"
                >Seleccionar Cliente*</label
            >
            <el-select
                placeholder="Seleccionar Cliente"
                class="w-100"
                :class="{ 'is-invalid': errors.cliente_id }"
                v-model="tarifa_pago.cliente_id"
                clearable
                filtereable
                @change="getSolicitudPedidosByCliente"
            >
                <el-option
                    v-for="item in listClientes"
                    :key="item.id"
                    :value="item.id"
                    :label="item.empresa"
                >
                </el-option>
            </el-select>
            <span
                class="error invalid-feedback"
                v-if="errors.cliente_id"
                v-text="errors.cliente_id[0]"
            ></span>
        </div>
        <div class="form-group col-md-6" v-else>
            <label
                :class="{
                    'text-danger': errors.cliente_id,
                }"
                >Cliente*</label
            >
            <el-input
                v-if="tarifa_pago.user"
                placeholder="Seleccionar Cliente"
                class="w-100"
                :class="{ 'is-invalid': errors.cliente_id }"
                v-model="tarifa_pago.user.empresa"
                readonly
            >
            </el-input>
            <span
                class="error invalid-feedback"
                v-if="errors.cliente_id"
                v-text="errors.cliente_id[0]"
            ></span>
        </div>
        <div class="form-group col-md-6" v-if="accion == 'nuevo'">
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
                v-model="tarifa_pago.solicitud_pedido_id"
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
        <div class="form-group col-md-6" v-else>
            <label
                :class="{
                    'text-danger': errors.solicitud_pedido_id,
                }"
                >Código de Pedido*</label
            >
            <el-input
                v-if="tarifa_pago.solicitud_pedido"
                placeholder="Seleccionar Código de Pedido"
                class="w-100"
                :class="{ 'is-invalid': errors.solicitud_pedido_id }"
                v-model="tarifa_pago.solicitud_pedido.codigo"
                readonly
            >
            </el-input>
            <span
                class="error invalid-feedback"
                v-if="errors.solicitud_pedido_id"
                v-text="errors.solicitud_pedido_id[0]"
            ></span>
        </div>
        <div class="col-md-12">
            <hr />
            <h4 class="w-100 text-center">Productos</h4>
        </div>
        <div class="col-md-12" style="overflow: auto">
            <table class="table table-bordered table-striped table_productos">
                <thead class="bg-warning text-white">
                    <tr>
                        <th rowspan="2">Detalle Producto</th>
                        <th rowspan="2">Cantidad</th>
                        <th colspan="3" class="text-center bg-blue">Lana</th>
                        <th colspan="3" class="text-center bg-info">
                            Parametros
                        </th>
                        <th colspan="3" class="text-center">A Cancelar Bs.</th>
                    </tr>
                    <tr>
                        <th class="bg-blue text-center">Título</th>
                        <th class="bg-blue text-center">Color Código</th>
                        <th class="bg-blue text-center">Peso (gr)1</th>
                        <th class="bg-info text-center">M.O.</th>
                        <th class="bg-info text-center">DEP.</th>
                        <th class="bg-info text-center">GAN.</th>
                        <th class="text-center">Mano de Obra</th>
                        <th class="text-center">Depreciación</th>
                        <th class="text-center">Ganancia</th>
                    </tr>
                </thead>
                <tbody>
                    <template v-if="tarifa_pago.tarifa_detalles.length > 0">
                        <tr
                            v-for="(item, index) in tarifa_pago.tarifa_detalles"
                        >
                            <td>
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
                                            item.solicitud_detalle.descripcion
                                        }}</span>
                                    </div>
                                    <div class="desc talla">
                                        <strong>Talla: </strong
                                        ><span>{{
                                            item.solicitud_detalle.talla
                                        }}</span>
                                    </div>
                                    <div class="desc elaborado">
                                        <strong>Elaborado: </strong
                                        ><span>{{
                                            item.solicitud_detalle.elaborado
                                        }}</span>
                                    </div>
                                </div>
                            </td>
                            <td class="text-center">
                                {{ item.solicitud_detalle.cantidad }}
                            </td>
                            <td>{{ item.solicitud_detalle.titulo }}</td>
                            <td>
                                {{ item.solicitud_detalle.codigo_color }}
                            </td>
                            <td class="text-center">
                                {{ item.solicitud_detalle.peso }}
                            </td>
                            <td>
                                <input
                                    type="number"
                                    step="0.01"
                                    class="form-control"
                                    :class="{
                                        'is-invalid':
                                            errors['mano_obra_' + index],
                                    }"
                                    v-model="item.mano_obra"
                                    @change="recalcularPagos"
                                    @keyup="recalcularPagos"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors['mano_obra_' + index]"
                                    v-text="errors['mano_obra_' + index][0]"
                                ></span>
                            </td>
                            <td>
                                <input
                                    type="number"
                                    step="0.01"
                                    class="form-control"
                                    :class="{
                                        'is-invalid':
                                            errors['depreciacion_' + index],
                                    }"
                                    v-model="item.depreciacion"
                                    @change="recalcularPagos"
                                    @keyup="recalcularPagos"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors['depreciacion_' + index]"
                                    v-text="errors['depreciacion_' + index][0]"
                                ></span>
                            </td>
                            <td>
                                <input
                                    type="number"
                                    step="0.01"
                                    class="form-control"
                                    :class="{
                                        'is-invalid':
                                            errors['ganancia_' + index],
                                    }"
                                    v-model="item.ganancia"
                                    @change="recalcularPagos"
                                    @keyup="recalcularPagos"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors['ganancia_' + index]"
                                    v-text="errors['ganancia_' + index][0]"
                                ></span>
                            </td>
                            <td class="text-center">
                                {{ item.mano_obra_pagar }}
                            </td>
                            <td class="text-center">
                                {{ item.depreciacion_pagar }}
                            </td>
                            <td class="text-center">
                                {{ item.ganancia_pagar }}
                            </td>
                        </tr>
                        <tr>
                            <td class="text-center font-weight-bold bg-warning">
                                TOTAL
                            </td>
                            <td class="text-center font-weight-bold bg-warning">
                                {{ tarifa_pago.cantidad }}
                            </td>
                            <td
                                class="text-center font-weight-bold bg-warning"
                            ></td>
                            <td
                                class="text-center font-weight-bold bg-warning"
                            ></td>
                            <td class="text-center font-weight-bold bg-warning">
                                {{ tarifa_pago.peso }}
                            </td>
                            <td
                                class="text-center font-weight-bold bg-warning"
                            ></td>
                            <td
                                class="text-center font-weight-bold bg-warning"
                            ></td>
                            <td
                                class="text-center font-weight-bold bg-warning"
                            ></td>
                            <td class="text-center font-weight-bold bg-warning">
                                {{ tarifa_pago.mano_obra }}
                            </td>
                            <td class="text-center font-weight-bold bg-warning">
                                {{ tarifa_pago.depreciacion }}
                            </td>
                            <td class="text-center font-weight-bold bg-warning">
                                {{ tarifa_pago.ganancia }}
                            </td>
                        </tr>
                    </template>
                    <template v-else>
                        <tr>
                            <td colspan="11" class="text-center">
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
                :to="{ name: 'tarifa_pagos.index' }"
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
        tarifa_pago: {
            type: Object,
            default: {
                id: 0,
                cliente_id: "",
                solicitud_pedido_id: "",
                cantidad: "",
                peso: "",
                mano_obra: "",
                depreciacion: "",
                ganancia: "",
                tarifa_detalles: [],
            },
        },
    },
    computed: {
        txtBtn() {
            if (this.enviando) {
                return `<i class="fa fa-spinner fa-spin"></i> Enviando...`;
            }
            if (this.accion == "nuevo") {
                return `<i class="fa fa-save"></i> Registrar Tarifa de Pago`;
            }
            if (this.accion == "edit") {
                return `<i class="fa fa-edit"></i> Actualizar Tarifa de Pago`;
            }
        },
    },
    watch: {
        accion(newVal) {
            if (newVal == "nuevo") {
                this.tarifa_pago.fecha_recepcion = this.getFechaActual();
            } else {
                this.getSolicitudPedidosByCliente();
            }
        },
        tarifa_pago(newval) {
            this.getSolicitudPedidosByCliente();
        },
    },
    mounted() {
        if (this.accion == "nuevo") {
            this.tarifa_pago.fecha_recepcion = this.getFechaActual();
        }
        this.getClientes();
    },
    data() {
        return {
            enviando: false,
            errors: [],
            listSolicitudPedidos: [],
            listClientes: [],
        };
    },
    methods: {
        getSolicitudPedidosByCliente() {
            if (this.tarifa_pago.cliente_id != "") {
                axios
                    .get(main_url + "/admin/solicitud_pedidos/byCliente", {
                        params: {
                            cliente_id: this.tarifa_pago.cliente_id,
                        },
                    })
                    .then((response) => {
                        this.listSolicitudPedidos =
                            response.data.solicitud_pedidos;
                    });
            } else {
                this.listSolicitudPedidos = [];
            }
        },
        getClientes() {
            axios.get(main_url + "/admin/clientes").then((response) => {
                this.listClientes = response.data.clientes;
            });
        },
        getSolicitudPedido() {
            this.tarifa_pago.tarifa_detalles = [];

            if (this.tarifa_pago.solicitud_pedido_id != "") {
                axios
                    .get(
                        main_url +
                            "/admin/solicitud_pedidos/" +
                            this.tarifa_pago.solicitud_pedido_id
                    )
                    .then((response) => {
                        const solicitud_detalles =
                            response.data.solicitud_pedido.solicitud_detalles;
                        this.tarifa_pago.mano_obra = 0;
                        this.tarifa_pago.depreciacion = 0;
                        this.tarifa_pago.ganancia = 0;
                        solicitud_detalles.forEach((elem) => {
                            this.tarifa_pago.tarifa_detalles.push({
                                id: 0,
                                tarifa_pago_id: "",
                                solicitud_detalle_id: elem.id,
                                cantidad: elem.cantidad,
                                peso: elem.peso,
                                mano_obra: 0,
                                mano_obra_pagar: 0,
                                depreciacion: 0,
                                depreciacion_pagar: 0,
                                ganancia: 0,
                                ganancia_pagar: 0,
                                solicitud_detalle: elem,
                            });
                            this.tarifa_pago.cantidad += parseFloat(
                                elem.cantidad
                            );
                            this.tarifa_pago.peso += parseFloat(elem.peso);
                        });
                    });
            }
        },
        recalcularPagos() {
            let total_mano_obra = 0;
            let total_depreciacion = 0;
            let total_ganancia = 0;
            if (this.tarifa_pago.tarifa_detalles.length > 0) {
                this.tarifa_pago.tarifa_detalles.forEach((elem, index) => {
                    let mano_obra_pagar = 0;
                    let depreciacion_pagar = 0;
                    let ganancia_pagar = 0;
                    if (elem.mano_obra != "") {
                        mano_obra_pagar =
                            parseFloat(elem.mano_obra) * elem.cantidad;
                    }
                    if (elem.depreciacion != "") {
                        depreciacion_pagar =
                            parseFloat(elem.depreciacion) * elem.cantidad;
                    }
                    if (elem.ganancia != "") {
                        ganancia_pagar =
                            parseFloat(elem.ganancia) * elem.cantidad;
                    }
                    this.tarifa_pago.tarifa_detalles[index].mano_obra_pagar =
                        mano_obra_pagar;
                    this.tarifa_pago.tarifa_detalles[index].depreciacion_pagar =
                        depreciacion_pagar;
                    this.tarifa_pago.tarifa_detalles[index].ganancia_pagar =
                        ganancia_pagar;

                    total_mano_obra += parseFloat(mano_obra_pagar);
                    total_depreciacion += parseFloat(depreciacion_pagar);
                    total_ganancia += parseFloat(ganancia_pagar);
                });
            }
            this.tarifa_pago.mano_obra = total_mano_obra;
            this.tarifa_pago.depreciacion = total_depreciacion;
            this.tarifa_pago.ganancia = total_ganancia;
        },
        enviarFormulario() {
            this.enviando = true;
            try {
                let url = main_url + "/admin/tarifa_pagos";
                if (this.accion == "edit") {
                    url =
                        main_url + "/admin/tarifa_pagos/" + this.tarifa_pago.id;
                    this.tarifa_pago["_method"] = "put";
                }
                axios
                    .post(url, this.tarifa_pago)
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
                            name: "tarifa_pagos.index",
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
<style>
.table_productos thead tr th,
.table_productos tbody tr td {
    vertical-align: middle;
}
</style>
