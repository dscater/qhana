<template>
    <div class="row">
        <div class="form-group col-md-4">
            <label
                :class="{
                    'text-danger': errors.codigo,
                }"
                >Código de Pedido*</label
            >
            <el-input
                placeholder="Código de Pedido"
                :class="{ 'is-invalid': errors.codigo }"
                v-model="solicitud_pedido.codigo"
                clearable
            >
            </el-input>
            <span
                class="error invalid-feedback"
                v-if="errors.codigo"
                v-text="errors.codigo[0]"
            ></span>
        </div>
        <div class="form-group col-md-4">
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
                v-model="solicitud_pedido.cliente_id"
                clearable
                filtereable
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
                v-model="solicitud_pedido.fecha_recepcion"
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
            <table class="table table-bordered">
                <thead class="bg-warning text-white">
                    <tr>
                        <th>Código Producto</th>
                        <th>Descripción</th>
                        <th>Talla</th>
                        <th>Cantidad</th>
                        <th>Elaborado</th>
                        <th>Título</th>
                        <th>Color Código</th>
                        <th>Peso (gr)</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <template
                        v-if="solicitud_pedido.solicitud_detalles.length > 0"
                    >
                        <tr
                            v-for="(
                                item, index
                            ) in solicitud_pedido.solicitud_detalles"
                        >
                            <td>
                                <input
                                    type="text"
                                    placeholder="Código"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors['codigo_' + index],
                                    }"
                                    v-model="item.codigo"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors['codigo_' + index]"
                                    v-text="errors['codigo_' + index][0]"
                                ></span>
                            </td>
                            <td>
                                <input
                                    type="text"
                                    placeholder="Descripción"
                                    class="form-control"
                                    :class="{
                                        'is-invalid':
                                            errors['descripcion_' + index],
                                    }"
                                    v-model="item.descripcion"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors['descripcion_' + index]"
                                    v-text="errors['descripcion_' + index][0]"
                                ></span>
                            </td>
                            <td>
                                <input
                                    type="text"
                                    placeholder="Talla"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors['talla_' + index],
                                    }"
                                    v-model="item.talla"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors['talla_' + index]"
                                    v-text="errors['talla_' + index][0]"
                                ></span>
                            </td>
                            <td>
                                <input
                                    type="number"
                                    step="0.01"
                                    placeholder="Cantidad"
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
                            <td>
                                <select
                                    placeholder="Elaborado"
                                    class="form-control"
                                    :class="{
                                        'is-invalid':
                                            errors['elaborado_' + index],
                                    }"
                                    v-model="item.elaborado"
                                >
                                    <option value="">- Seleccione -</option>
                                    <option value="MANO">MANO</option>
                                    <option value="MAQUINA">MAQUINA</option>
                                    <option value="INDUSTRIAL">
                                        INDUSTRIAL
                                    </option>
                                </select>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors['elaborado_' + index]"
                                    v-text="errors['elaborado_' + index][0]"
                                ></span>
                            </td>
                            <td>
                                <input
                                    type="text"
                                    placeholder="Título"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors['titulo_' + index],
                                    }"
                                    v-model="item.titulo"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors['titulo_' + index]"
                                    v-text="errors['titulo_' + index][0]"
                                ></span>
                            </td>
                            <td>
                                <input
                                    type="text"
                                    placeholder="Código Color"
                                    class="form-control"
                                    :class="{
                                        'is-invalid':
                                            errors['codigo_color_' + index],
                                    }"
                                    v-model="item.codigo_color"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors['codigo_color_' + index]"
                                    v-text="errors['codigo_color_' + index][0]"
                                ></span>
                            </td>
                            <td>
                                <input
                                    type="number"
                                    step="0.01"
                                    placeholder="Peso"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors['peso_' + index],
                                    }"
                                    v-model="item.peso"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors['peso_' + index]"
                                    v-text="errors['peso_' + index][0]"
                                ></span>
                            </td>
                            <td>
                                <button
                                    class="btn btn-xs btn-danger"
                                    @click.prevent="
                                        eliminarDetalle(index, item.id)
                                    "
                                >
                                    <i class="fa fa-trash"></i>
                                </button>
                            </td>
                        </tr>
                    </template>
                    <template v-else>
                        <tr>
                            <td colspan="9" class="text-center">
                                NO SE AGREGARON PRODUCTOS
                            </td>
                        </tr>
                    </template>
                    <template></template>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="9" class="p-0">
                            <button
                                class="btn btn-primary btn-flat btn-block"
                                @click.prevent="agregarDetalle"
                            >
                                <i class="fa fa-plus"></i> Agregar Producto
                            </button>
                        </td>
                    </tr>
                </tfoot>
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
            <router-link :to="{ name: 'solicitud_pedidos.index' }" class="btn btn-default btn-block btn-flat">
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
        solicitud_pedido: {
            type: Object,
            default: {
                id: 0,
                codigo: "",
                cliente_id: "",
                fecha_recepcion: "",
                solicitud_detalles: [],
            },
        },
    },
    computed: {
        txtBtn() {
            if (this.enviando) {
                return `<i class="fa fa-spinner fa-spin"></i> Enviando...`;
            }
            if (this.accion == "nuevo") {
                return `<i class="fa fa-save"></i> Registrar Solicitud`;
            }
            if (this.accion == "edit") {
                return `<i class="fa fa-edit"></i> Actualizar Solicitud`;
            }
        },
    },
    watch: {
        accion(newVal) {
            if (newVal == "nuevo") {
                this.solicitud_pedido.fecha_recepcion = this.getFechaActual();
            }
        },
    },
    mounted() {
        if (this.accion == "nuevo") {
            this.solicitud_pedido.fecha_recepcion = this.getFechaActual();
        }
        this.getClientes();
    },
    data() {
        return {
            enviando: false,
            errors: [],
            listClientes: [],
            eliminados: [],
        };
    },
    methods: {
        getClientes() {
            axios.get(main_url + "/admin/clientes").then((response) => {
                this.listClientes = response.data.clientes;
            });
        },
        agregarDetalle() {
            this.solicitud_pedido.solicitud_detalles.push({
                id: 0,
                solicitud_pedido_id: "",
                codigo: "",
                descripcion: "",
                talla: "",
                cantidad: "",
                elaborado: "",
                titulo: "",
                codigo_color: "",
                peso: "",
            });
        },
        eliminarDetalle(index, id) {
            if (id != 0) {
                this.eliminados.push(id);
            }
            this.solicitud_pedido.solicitud_detalles.splice(index, 1);
        },
        enviarFormulario() {
            this.enviando = true;
            try {
                let url = main_url + "/admin/solicitud_pedidos";
                if (this.accion == "edit") {
                    url =
                        main_url +
                        "/admin/solicitud_pedidos/" +
                        this.solicitud_pedido.id;
                    this.solicitud_pedido["_method"] = "put";
                    this.solicitud_pedido["eliminados"] = this.eliminados;
                }
                axios
                    .post(url, this.solicitud_pedido)
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
                            name: "solicitud_pedidos.index",
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
                                    showConfirmButton: false,
                                    timer: 2000,
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
