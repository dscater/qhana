<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Pedidos</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <b-col lg="10" class="my-1">
                                        <b-form-group
                                            label="Buscar"
                                            label-for="filter-input"
                                            label-cols-sm="3"
                                            label-align-sm="right"
                                            label-size="sm"
                                            class="mb-0"
                                        >
                                            <b-input-group size="sm">
                                                <b-form-input
                                                    id="filter-input"
                                                    v-model="filter"
                                                    type="search"
                                                    placeholder="Buscar"
                                                ></b-form-input>

                                                <b-input-group-append>
                                                    <b-button
                                                        variant="warning"
                                                        :disabled="!filter"
                                                        @click="filter = ''"
                                                        >Borrar</b-button
                                                    >
                                                </b-input-group-append>
                                            </b-input-group>
                                        </b-form-group>
                                    </b-col>
                                    <div class="col-md-12">
                                        <b-overlay
                                            :show="showOverlay"
                                            rounded="sm"
                                        >
                                            <b-table
                                                :fields="fields"
                                                :items="listRegistros"
                                                show-empty
                                                stacked="md"
                                                responsive
                                                :current-page="currentPage"
                                                :per-page="perPage"
                                                @filtered="onFiltered"
                                                empty-text="Sin resultados"
                                                empty-filtered-text="Sin resultados"
                                                :filter="filter"
                                            >
                                                <template
                                                    #cell(monto_total)="row"
                                                >
                                                    <span
                                                        class="text-md badge badge-warning text-white"
                                                        >{{
                                                            row.item.monto_total
                                                        }}</span
                                                    >
                                                </template>
                                                <template #cell(estado)="row">
                                                    <span
                                                        class="text-md badge"
                                                        :class="[
                                                            row.item.estado ==
                                                            'ELIMINADO'
                                                                ? 'badge-danger'
                                                                : row.item
                                                                      .estado ==
                                                                  'ATENDIDO'
                                                                ? 'badge-success'
                                                                : 'badge-primary',
                                                        ]"
                                                        >{{
                                                            row.item.estado
                                                        }}</span
                                                    >
                                                </template>

                                                <template #cell(accion)="row">
                                                    <div
                                                        class="row justify-content-between"
                                                    >
                                                        <b-button
                                                            size="sm"
                                                            pill
                                                            variant="outline-primary"
                                                            class="btn-flat btn-block"
                                                            title="Ver registro"
                                                            @click="
                                                                verRegistro(
                                                                    row.item
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-eye"
                                                            ></i>
                                                        </b-button>
                                                        <b-button
                                                            v-if="
                                                                row.item
                                                                    .estado !=
                                                                    'ELIMINADO' &&
                                                                row.item
                                                                    .estado !=
                                                                    'ATENDIDO'
                                                            "
                                                            size="sm"
                                                            pill
                                                            variant="outline-success"
                                                            class="btn-flat btn-block"
                                                            title="Confirmar pedido"
                                                            @click="
                                                                atenderPedido(
                                                                    row.item
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-check"
                                                            ></i>
                                                        </b-button>
                                                        <b-button
                                                            v-if="
                                                                permisos.includes(
                                                                    'pedidos.destroy'
                                                                ) &&
                                                                row.item
                                                                    .estado !=
                                                                    'ELIMINADO'
                                                            "
                                                            size="sm"
                                                            pill
                                                            variant="outline-danger"
                                                            class="btn-flat btn-block"
                                                            title="Eliminar pedido"
                                                            @click="
                                                                eliminaPedido(
                                                                    row.item
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-trash"
                                                            ></i>
                                                        </b-button>
                                                        <b-button
                                                            v-if="
                                                                permisos.includes(
                                                                    'pedidos.destroy'
                                                                ) &&
                                                                row.item
                                                                    .estado ==
                                                                    'ELIMINADO' &&
                                                                row.item
                                                                    .estado !=
                                                                    'ATENDIDO'
                                                            "
                                                            size="sm"
                                                            pill
                                                            variant="outline-warning"
                                                            class="btn-flat btn-block"
                                                            title="Restablecer pedido"
                                                            @click="
                                                                restablecerPedido(
                                                                    row.item
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-sync-alt"
                                                            ></i>
                                                        </b-button>
                                                    </div>
                                                </template>
                                            </b-table>
                                        </b-overlay>
                                        <div class="row">
                                            <b-col
                                                sm="6"
                                                md="2"
                                                class="ml-auto my-1"
                                            >
                                                <b-form-select
                                                    align="right"
                                                    id="per-page-select"
                                                    v-model="perPage"
                                                    :options="pageOptions"
                                                    size="sm"
                                                ></b-form-select>
                                            </b-col>
                                            <b-col
                                                sm="6"
                                                md="2"
                                                class="my-1 mr-auto"
                                                v-if="perPage"
                                            >
                                                <b-pagination
                                                    v-model="currentPage"
                                                    :total-rows="totalRows"
                                                    :per-page="perPage"
                                                    align="left"
                                                ></b-pagination>
                                            </b-col>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            search: "",
            listRegistros: [],
            showOverlay: false,
            fields: [
                {
                    key: "nro_pedido",
                    label: "Nro. Pedido",
                    sortable: true,
                },
                {
                    key: "full_name",
                    label: "Nombre de Cliente",
                    sortable: true,
                },
                { key: "pec", label: "Dirección" },
                { key: "fono", label: "Teléfono" },
                { key: "monto_total", label: "Total Compra" },
                { key: "estado", label: "estado" },
                { key: "fecha_pedido", label: "Fecha del Pedido" },
                { key: "accion", label: "Acción" },
            ],
            loading: true,
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            muestra_modal: false,
            modal_accion: "nuevo",
            oPedido: {
                id: 0,
                nombre: "",
                descripcion: "",
                precio: "",
                cantidad_stock: "",
                catalogo_id: "",
                imagen: null,
            },
            currentPage: 1,
            perPage: 5,
            pageOptions: [
                { value: 5, text: "Mostrar 5 Registros" },
                { value: 10, text: "Mostrar 10 Registros" },
                { value: 25, text: "Mostrar 25 Registros" },
                { value: 50, text: "Mostrar 50 Registros" },
                { value: 100, text: "Mostrar 100 Registros" },
                { value: this.totalRows, text: "Mostrar Todo" },
            ],
            totalRows: 10,
            filter: null,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getPedidos();
    },
    methods: {
        // Seleccionar Opciones de Tabla
        verRegistro(item) {
            this.$router.push({
                name: "pedidos.show",
                params: { id: item.id },
            });
        },

        // Listar Pedidos
        getPedidos() {
            this.showOverlay = true;
            this.muestra_modal = false;
            let url = main_url + "/admin/pedidos";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios
                .get(url, {
                    params: { per_page: this.per_page },
                })
                .then((res) => {
                    this.showOverlay = false;
                    this.listRegistros = res.data.pedidos;
                    this.totalRows = res.data.total;
                });
        },
        atenderPedido(item) {
            let id = item.id;
            let mensaje = `<div class="detalle_confirmacion">`;
            mensaje += `<p class="text-left"><strong>Nro. Pedido: </strong>${item.nro_pedido}</p>`;
            mensaje += `<p class="text-left"><strong>Cliente: </strong>${item.full_name}</p>`;
            mensaje += `<p class="text-left"><strong>Monto: </strong>${item.monto_total}</p>`;
            mensaje += `<p class="text-left"><strong>Fecha del pedido: </strong>${item.fecha_pedido}</p>`;
            mensaje += `</div>`;
            Swal.fire({
                title: "¿Quierés cambiar este registro a Atendido?",
                html: mensaje,
                showCancelButton: true,
                confirmButtonColor: "#28a745",
                confirmButtonText: "Si, estoy seguro(a)",
                cancelButtonText: "No, cancelar",
                denyButtonText: `No, cancelar`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                let data = {};
                data.estado = "ATENDIDO";
                data["_method"] = "put";
                if (result.isConfirmed) {
                    axios
                        .post(
                            main_url + "/admin/pedidos/atenderPedido/" + id,
                            data
                        )
                        .then((res) => {
                            this.getPedidos();
                            this.filter = "";
                            Swal.fire({
                                icon: "success",
                                title: res.data.msj,
                                showConfirmButton: false,
                                timer: 1500,
                            });
                        })
                        .catch((error) => {
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
                }
            });
        },
        eliminaPedido(item) {
            let id = item.id;
            let mensaje = `<div class="detalle_confirmacion">`;
            mensaje += `<p class="text-left"><strong>Nro. Pedido: </strong>${item.nro_pedido}</p>`;
            mensaje += `<p class="text-left"><strong>Cliente: </strong>${item.full_name}</p>`;
            mensaje += `<p class="text-left"><strong>Monto: </strong>${item.monto_total}</p>`;
            mensaje += `<p class="text-left"><strong>Fecha del pedido: </strong>${item.fecha_pedido}</p>`;
            mensaje += `</div>`;
            Swal.fire({
                title: "¿Quierés eliminar este registro?",
                html: mensaje,
                showCancelButton: true,
                confirmButtonColor: "#dc3545",
                confirmButtonText: "Si, eliminar",
                cancelButtonText: "No, cancelar",
                denyButtonText: `No, cancelar`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                let data = {};
                data.estado = "ELIMINADO";
                data["_method"] = "put";
                if (result.isConfirmed) {
                    axios
                        .post(
                            main_url + "/admin/pedidos/eliminarPedido/" + id,
                            data
                        )
                        .then((res) => {
                            this.getPedidos();
                            this.filter = "";
                            Swal.fire({
                                icon: "success",
                                title: res.data.msj,
                                showConfirmButton: false,
                                timer: 1500,
                            });
                        })
                        .catch((error) => {
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
                }
            });
        },
        restablecerPedido(item) {
            let id = item.id;
            let mensaje = `<div class="detalle_confirmacion">`;
            mensaje += `<p class="text-left"><strong>Nro. Pedido: </strong>${item.nro_pedido}</p>`;
            mensaje += `<p class="text-left"><strong>Cliente: </strong>${item.full_name}</p>`;
            mensaje += `<p class="text-left"><strong>Monto: </strong>${item.monto_total}</p>`;
            mensaje += `<p class="text-left"><strong>Fecha del pedido: </strong>${item.fecha_pedido}</p>`;
            mensaje += `</div>`;
            Swal.fire({
                title: "¿Quierés restablecer este registro?",
                html: mensaje,
                showCancelButton: true,
                confirmButtonColor: "#c57a40",
                confirmButtonText: "Si, estoy seguro(a)",
                cancelButtonText: "No, cancelar",
                denyButtonText: `No, cancelar`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                let data = {};
                data.estado = "PENDIENTE";
                data["_method"] = "put";
                if (result.isConfirmed) {
                    axios
                        .post(
                            main_url + "/admin/pedidos/restablecerPedido/" + id,
                            data
                        )
                        .then((res) => {
                            this.getPedidos();
                            this.filter = "";
                            Swal.fire({
                                icon: "success",
                                title: res.data.msj,
                                showConfirmButton: false,
                                timer: 1500,
                            });
                        })
                        .catch((error) => {
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
                }
            });
        },
        abreModal(tipo_accion = "nuevo", pedido = null) {
            this.muestra_modal = true;
            this.modal_accion = tipo_accion;
            if (pedido) {
                this.oPedido = pedido;
            }
        },
        onFiltered(filteredItems) {
            // Trigger pagination to update the number of buttons/pages due to filtering
            this.totalRows = filteredItems.length;
            this.currentPage = 1;
        },
        limpiaPedido() {
            this.oPedido.nombre = "";
            this.oPedido.descripcion = "";
            this.oPedido.precio = "";
            this.oPedido.cantidad_stock = "";
            this.oPedido.catalogo_id = "";
            this.oPedido.imagen = null;
        },
        formatoFecha(date) {
            return this.$moment(String(date)).format("DD/MM/YYYY");
        },
    },
};
</script>

<style>
.detalle_confirmacion {
    display: flex;
    flex-direction: column;
    width: 80%;
    margin: auto;
}
@media (max-width: 800px) {
    .detalle_confirmacion {
        width: 98%;
    }
}
</style>
