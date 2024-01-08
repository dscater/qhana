<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Recepción de Pedidos</h1>
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
                                        <router-link
                                            v-if="
                                                permisos.includes(
                                                    'recepcion_pedidos.create'
                                                )
                                            "
                                            class="btn btn-warning btn-flat btn-block"
                                            :to="{
                                                name: 'recepcion_pedidos.create',
                                            }"
                                        >
                                            <i class="fa fa-plus"></i>
                                            Nuevo
                                        </router-link>
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
                                                <template #cell(mas)="row">
                                                    <b-button
                                                        variant="warning"
                                                        size="sm"
                                                        @click="
                                                            row.toggleDetails
                                                        "
                                                    >
                                                        {{
                                                            row.detailsShowing
                                                                ? "Ocultar"
                                                                : "Mostrar"
                                                        }}
                                                        Detalles
                                                    </b-button>
                                                </template>

                                                <template #row-details="row">
                                                    <b-card>
                                                        <b-row
                                                            class="mb-2"
                                                            style="
                                                                overflow: auto;
                                                            "
                                                        >
                                                            <b-col cols="12">
                                                                <table
                                                                    class="table table-striped"
                                                                >
                                                                    <thead>
                                                                        <tr>
                                                                            <th>
                                                                                Detalle
                                                                                Producto
                                                                            </th>
                                                                            <th>
                                                                                Recepción
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <template
                                                                            v-if="
                                                                                row
                                                                                    .item
                                                                                    .recepcion_detalles
                                                                                    .length >
                                                                                0
                                                                            "
                                                                        >
                                                                            <template
                                                                                v-for="(
                                                                                    item,
                                                                                    index
                                                                                ) in row
                                                                                    .item
                                                                                    .recepcion_detalles"
                                                                            >
                                                                                <tr>
                                                                                    <td
                                                                                        rowspan="2"
                                                                                    >
                                                                                        <div
                                                                                            class="descripcion_producto"
                                                                                        >
                                                                                            <div
                                                                                                class="desc codigo"
                                                                                            >
                                                                                                <strong
                                                                                                    >Código: </strong
                                                                                                ><span
                                                                                                    >{{
                                                                                                        item
                                                                                                            .solicitud_detalle
                                                                                                            .codigo
                                                                                                    }}</span
                                                                                                >
                                                                                            </div>
                                                                                            <div
                                                                                                class="desc descripcion"
                                                                                            >
                                                                                                <strong
                                                                                                    >Descripción: </strong
                                                                                                ><span
                                                                                                    >{{
                                                                                                        item
                                                                                                            .solicitud_detalle
                                                                                                            .descripcion
                                                                                                    }}</span
                                                                                                >
                                                                                            </div>
                                                                                            <div
                                                                                                class="desc talla"
                                                                                            >
                                                                                                <strong
                                                                                                    >Talla: </strong
                                                                                                ><span
                                                                                                    >{{
                                                                                                        item
                                                                                                            .solicitud_detalle
                                                                                                            .talla
                                                                                                    }}</span
                                                                                                >
                                                                                            </div>
                                                                                            <div
                                                                                                class="desc cantidad"
                                                                                            >
                                                                                                <strong
                                                                                                    >Cantidad: </strong
                                                                                                ><span
                                                                                                    class="badge badge-primary text-md"
                                                                                                    >{{
                                                                                                        item
                                                                                                            .solicitud_detalle
                                                                                                            .cantidad
                                                                                                    }}</span
                                                                                                >
                                                                                            </div>
                                                                                            <div
                                                                                                class="desc elaborado"
                                                                                            >
                                                                                                <strong
                                                                                                    >Elaborado: </strong
                                                                                                ><span
                                                                                                    >{{
                                                                                                        item
                                                                                                            .solicitud_detalle
                                                                                                            .elaborado
                                                                                                    }}</span
                                                                                                >
                                                                                            </div>
                                                                                            <div
                                                                                                class="desc titulo"
                                                                                            >
                                                                                                <strong
                                                                                                    >Título: </strong
                                                                                                ><span
                                                                                                    >{{
                                                                                                        item
                                                                                                            .solicitud_detalle
                                                                                                            .titulo
                                                                                                    }}</span
                                                                                                >
                                                                                            </div>
                                                                                            <div
                                                                                                class="desc codigo_color"
                                                                                            >
                                                                                                <strong
                                                                                                    >Color
                                                                                                    Código: </strong
                                                                                                ><span
                                                                                                    >{{
                                                                                                        item
                                                                                                            .solicitud_detalle
                                                                                                            .codigo_color
                                                                                                    }}</span
                                                                                                >
                                                                                            </div>
                                                                                            <div
                                                                                                class="desc peso"
                                                                                            >
                                                                                                <strong
                                                                                                    >Peso: </strong
                                                                                                ><span
                                                                                                    class="badge badge-info text-md"
                                                                                                    >{{
                                                                                                        item
                                                                                                            .solicitud_detalle
                                                                                                            .peso
                                                                                                    }}</span
                                                                                                >
                                                                                            </div>
                                                                                        </div>
                                                                                    </td>
                                                                                    <td>
                                                                                        Cantidad:
                                                                                        <span
                                                                                            class="badge badge-primary text-md"
                                                                                            >{{
                                                                                                item.cantidad
                                                                                            }}</span
                                                                                        >
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        Peso:
                                                                                        <span
                                                                                            class="badge badge-info text-md"
                                                                                            >{{
                                                                                                item.peso
                                                                                            }}</span
                                                                                        >
                                                                                    </td>
                                                                                </tr>
                                                                            </template>
                                                                        </template>
                                                                        <template
                                                                            v-else
                                                                        >
                                                                            <tr>
                                                                                <td
                                                                                    colspan="2"
                                                                                    class="text-center"
                                                                                >
                                                                                    NO
                                                                                    SE
                                                                                    ENCONTRARÓN
                                                                                    PRODUCTOS
                                                                                </td>
                                                                            </tr>
                                                                        </template>
                                                                        <template></template>
                                                                    </tbody>
                                                                </table>
                                                            </b-col>
                                                        </b-row>
                                                        <b-button
                                                            size="sm"
                                                            variant="warning"
                                                            @click="
                                                                row.toggleDetails
                                                            "
                                                            >Ocultar</b-button
                                                        >
                                                    </b-card>
                                                </template>

                                                <template #cell(accion)="row">
                                                    <div
                                                        class="row justify-content-between"
                                                    >
                                                        <b-button
                                                            v-if="
                                                                permisos.includes(
                                                                    'recepcion_pedidos.edit'
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
                                                                    'recepcion_pedidos.destroy'
                                                                )
                                                            "
                                                            size="sm"
                                                            pill
                                                            variant="outline-danger"
                                                            class="btn-flat btn-block"
                                                            title="Eliminar registro"
                                                            @click="
                                                                eliminaRecepcionPedido(
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
                    key: "id",
                    label: "Nro.",
                    sortable: true,
                },
                { key: "user.full_name", label: "Taller", sortable: true },
                {
                    key: "solicitud_pedido.codigo",
                    label: "Código de Pedido",
                    sortable: true,
                },
                {
                    key: "fecha_recepcion",
                    label: "Fecha de Recepción",
                    sortable: true,
                },
                {
                    key: "fecha_registro",
                    label: "Fecha de registro",
                    sortable: true,
                },
                { key: "mas", label: "Ver más" },
                { key: "accion", label: "Acción" },
            ],
            loading: true,
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            oRecepcionPedido: {
                id: 0,
                nombre: "",
                descripcion: "",
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
        this.getRecepcionPedidos();
    },
    methods: {
        // Listar RecepcionPedidos
        getRecepcionPedidos() {
            this.showOverlay = true;
            this.muestra_modal = false;
            let url = main_url + "/admin/recepcion_pedidos";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios
                .get(url, {
                    params: { per_page: this.per_page },
                })
                .then((res) => {
                    this.showOverlay = false;
                    this.listRegistros = res.data.recepcion_pedidos;
                    this.totalRows = res.data.total;
                });
        },
        editarRegistro(item) {
            this.$router.push({
                name: "recepcion_pedidos.edit",
                params: {
                    id: item.id,
                },
            });
        },
        eliminaRecepcionPedido(id, descripcion) {
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
                        .post(main_url + "/admin/recepcion_pedidos/" + id, {
                            _method: "DELETE",
                        })
                        .then((res) => {
                            this.getRecepcionPedidos();
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
        onFiltered(filteredItems) {
            // Trigger pagination to update the number of buttons/pages due to filtering
            this.totalRows = filteredItems.length;
            this.currentPage = 1;
        },
        formatoFecha(date) {
            return this.$moment(String(date)).format("DD/MM/YYYY");
        },
    },
};
</script>

<style></style>
