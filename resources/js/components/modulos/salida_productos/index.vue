<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Salida de Lana</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-md-3">
                                        <button
                                            v-if="
                                                permisos.includes(
                                                    'salida_productos.create'
                                                )
                                            "
                                            class="btn btn-warning btn-flat btn-block"
                                            @click="
                                                abreModal('nuevo');
                                                limpiaSalidaProducto();
                                            "
                                        >
                                            <i class="fa fa-plus"></i>
                                            Nuevo
                                        </button>
                                    </div>
                                </div>
                            </div>
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
                                                <template #cell(cantidad)="row">
                                                    <span
                                                        class="badge badge-primary text-md"
                                                        >{{
                                                            row.item.cantidad
                                                        }}</span
                                                    >
                                                </template>
                                                <template
                                                    #cell(cantidad_conos)="row"
                                                >
                                                    <span
                                                        class="badge badge-info text-md"
                                                        >{{
                                                            row.item
                                                                .cantidad_conos
                                                        }}</span
                                                    >
                                                </template>
                                                <template #cell(user_id)="row">
                                                    <span>{{
                                                        row.item.user?.full_name
                                                    }}</span>
                                                </template>
                                                <template
                                                    #cell(solicitud_pedido_id)="row"
                                                >
                                                    <span>{{
                                                        row.item
                                                            .solicitud_pedido
                                                            ?.codigo
                                                    }}</span>
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
                                                            title="Constancia"
                                                            @click="
                                                                pdf(row.item)
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-file-pdf"
                                                            ></i>
                                                        </b-button>
                                                        <b-button
                                                            v-if="
                                                                permisos.includes(
                                                                    'salida_productos.edit'
                                                                )
                                                            "
                                                            size="sm"
                                                            pill
                                                            variant="outline-warning"
                                                            class="btn-flat btn-block"
                                                            title="Editar registro"
                                                            @click="
                                                                editarRegistro(
                                                                    row.item
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-edit"
                                                            ></i>
                                                        </b-button>
                                                        <b-button
                                                            v-if="
                                                                permisos.includes(
                                                                    'salida_productos.destroy'
                                                                )
                                                            "
                                                            size="sm"
                                                            pill
                                                            variant="outline-danger"
                                                            class="btn-flat btn-block"
                                                            title="Eliminar registro"
                                                            @click="
                                                                eliminaSalidaProducto(
                                                                    row.item.id,
                                                                    `<br/><h4>¿Está seguro(a) de eliminar el registro nro. ${row.item.id}?</h4>`
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-trash"
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
        <Nuevo
            :muestra_modal="muestra_modal"
            :accion="modal_accion"
            :salida_producto="oSalidaProducto"
            @close="muestra_modal = false"
            @envioModal="getSalidaProductos"
        ></Nuevo>
    </div>
</template>

<script>
import Nuevo from "./Nuevo.vue";
export default {
    components: {
        Nuevo,
    },
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            search: "",
            listRegistros: [],
            showOverlay: false,
            fields: [
                {
                    key: "id",
                    label: "Nro.",
                    sortable: true,
                },
                {
                    key: "admin_producto.full_name",
                    label: "Producto",
                    sortable: true,
                },
                { key: "cantidad", label: "Cantidad", sortable: true },
                {
                    key: "cantidad_conos",
                    label: "Cantidad Conos",
                    sortable: true,
                },
                {
                    key: "user_id",
                    label: "Socio",
                    sortable: true,
                },
                {
                    key: "solicitud_pedido_id",
                    label: "Cód. Solicitud Pedido",
                    sortable: true,
                },
                {
                    key: "detalle",
                    label: "Detalle",
                    sortable: true,
                },
                {
                    key: "fecha_salida",
                    label: "Fecha de Salida",
                    sortable: true,
                },
                { key: "accion", label: "Acción" },
            ],
            loading: true,
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            muestra_modal: false,
            modal_accion: "nuevo",
            oSalidaProducto: {
                id: 0,
                admin_producto_id: "",
                cantidad: "",
                cantidad_conos: "",
                tipo_registro: "",
                user_id: "",
                solicitud_pedido_id: "",
                detalle: "",
                fecha_salida: "",
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
        this.getSalidaProductos();
    },
    methods: {
        pdf(item) {
            let config = {
                responseType: "blob",
            };
            axios
                .post(
                    main_url + "/admin/salida_productos/pdf/" + item.id,
                    null,
                    config
                )
                .then((res) => {
                    this.errors = [];
                    this.enviando = false;
                    let pdfBlob = new Blob([res.data], {
                        type: "application/pdf",
                    });
                    let urlReporte = URL.createObjectURL(pdfBlob);
                    window.open(urlReporte);
                })
                .catch(async (error) => {
                    let responseObj = await error.response.data.text();
                    responseObj = JSON.parse(responseObj);
                    console.log(error);
                    this.enviando = false;
                    if (error.response) {
                        if (error.response.status === 422) {
                            this.errors = responseObj.errors;
                        }
                        if (
                            error.response.status === 420 ||
                            error.response.status === 419 ||
                            error.response.status === 401
                        ) {
                            Swal.fire({
                                icon: "error",
                                title: "Error",
                                html: responseObj.message,
                                showConfirmButton: false,
                                timer: 2000,
                            });
                            window.location = "/";
                        }
                    }
                });
        },
        // Seleccionar Opciones de Tabla
        editarRegistro(item) {
            this.oSalidaProducto.id = item.id;
            this.oSalidaProducto.admin_producto_id = item.admin_producto_id
                ? item.admin_producto_id
                : "";
            this.oSalidaProducto.cantidad = item.cantidad ? item.cantidad : "";
            this.oSalidaProducto.cantidad_conos = item.cantidad_conos
                ? item.cantidad_conos
                : "";
            this.oSalidaProducto.fecha_salida = item.fecha_salida
                ? item.fecha_salida
                : "";
            this.oSalidaProducto.tipo_registro = item.tipo_registro
                ? item.tipo_registro
                : "";
            this.oSalidaProducto.user_id = item.user_id ? item.user_id : "";
            this.oSalidaProducto.solicitud_pedido_id = item.solicitud_pedido_id
                ? item.solicitud_pedido_id
                : "";
            this.oSalidaProducto.detalle = item.detalle ? item.detalle : "";
            this.oSalidaProducto.fecha_salida = item.fecha_salida
                ? item.fecha_salida
                : "";
            this.modal_accion = "edit";
            this.muestra_modal = true;
        },

        // Listar SalidaProductos
        getSalidaProductos() {
            this.showOverlay = true;
            this.muestra_modal = false;
            let url = main_url + "/admin/salida_productos";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios
                .get(url, {
                    params: { per_page: this.per_page },
                })
                .then((res) => {
                    this.showOverlay = false;
                    this.listRegistros = res.data.salida_productos;
                    this.totalRows = res.data.total;
                });
        },
        eliminaSalidaProducto(id, descripcion) {
            Swal.fire({
                title: "¿Quierés eliminar este registro?",
                html: `<strong>${descripcion}</strong>`,
                showCancelButton: true,
                confirmButtonColor: "#c57a40",
                confirmButtonText: "Si, eliminar",
                cancelButtonText: "No, cancelar",
                denyButtonText: `No, cancelar`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    axios
                        .post(main_url + "/admin/salida_productos/" + id, {
                            _method: "DELETE",
                        })
                        .then((res) => {
                            this.getSalidaProductos();
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
        abreModal(tipo_accion = "nuevo", salida_producto = null) {
            this.muestra_modal = true;
            this.modal_accion = tipo_accion;
            if (salida_producto) {
                this.oSalidaProducto = salida_producto;
            }
        },
        onFiltered(filteredItems) {
            // Trigger pagination to update the number of buttons/pages due to filtering
            this.totalRows = filteredItems.length;
            this.currentPage = 1;
        },
        limpiaSalidaProducto() {
            this.oSalidaProducto.admin_producto_id = "";
            this.oSalidaProducto.cantidad = "";
            this.oSalidaProducto.cantidad_conos = "";
            this.oSalidaProducto.tipo_registro = "";
            this.oSalidaProducto.user_id = "";
            this.oSalidaProducto.solicitud_pedido_id = "";
            this.oSalidaProducto.detalle = "";
            this.oSalidaProducto.fecha_salida = "";
        },
        formatoFecha(date) {
            return this.$moment(String(date)).format("DD/MM/YYYY");
        },
    },
};
</script>

<style></style>
