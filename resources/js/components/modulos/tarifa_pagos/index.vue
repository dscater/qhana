<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Tarifa de Pagos por Pedidos</h1>
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
                                                    'tarifa_pagos.create'
                                                )
                                            "
                                            class="btn btn-warning btn-flat btn-block"
                                            :to="{
                                                name: 'tarifa_pagos.create',
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
                                                            <v-col cols="12">
                                                                <p>
                                                                    <strong
                                                                        >Socio o
                                                                        Taller: </strong
                                                                    >{{
                                                                        row.item
                                                                            .tipo_registro ==
                                                                        "SOCIO O TALLER"
                                                                            ? row
                                                                                  .item
                                                                                  .user
                                                                                  .full_name
                                                                            : row
                                                                                  .item
                                                                                  .tipo_registro
                                                                    }}
                                                                </p>
                                                            </v-col>
                                                            <b-col cols="12">
                                                                <table
                                                                    class="table table-striped table_productos"
                                                                >
                                                                    <thead>
                                                                        <tr>
                                                                            <th
                                                                                rowspan="2"
                                                                            >
                                                                                Detalle
                                                                                Producto
                                                                            </th>
                                                                            <th
                                                                                rowspan="2"
                                                                            >
                                                                                Cantidad
                                                                            </th>
                                                                            <th
                                                                                colspan="3"
                                                                                class="text-center bg-blue"
                                                                            >
                                                                                Lana
                                                                            </th>
                                                                            <th
                                                                                colspan="3"
                                                                                class="text-center bg-info"
                                                                            >
                                                                                Parametros
                                                                            </th>
                                                                            <th
                                                                                colspan="3"
                                                                                class="text-center"
                                                                            >
                                                                                A
                                                                                Cancelar
                                                                                Bs.
                                                                            </th>
                                                                        </tr>
                                                                        <tr>
                                                                            <th
                                                                                class="bg-blue text-center"
                                                                            >
                                                                                Título
                                                                            </th>
                                                                            <th
                                                                                class="bg-blue text-center"
                                                                            >
                                                                                Color
                                                                                Código
                                                                            </th>
                                                                            <th
                                                                                class="bg-blue text-center"
                                                                            >
                                                                                Peso
                                                                                (gr)1
                                                                            </th>
                                                                            <th
                                                                                class="bg-info text-center"
                                                                            >
                                                                                M.O.
                                                                            </th>
                                                                            <th
                                                                                class="bg-info text-center"
                                                                            >
                                                                                DEP.
                                                                            </th>
                                                                            <th
                                                                                class="bg-info text-center"
                                                                            >
                                                                                GAN.
                                                                            </th>
                                                                            <th
                                                                                class="text-center"
                                                                            >
                                                                                Mano
                                                                                de
                                                                                Obra
                                                                            </th>
                                                                            <th
                                                                                class="text-center"
                                                                            >
                                                                                Depreciación
                                                                            </th>
                                                                            <th
                                                                                class="text-center"
                                                                            >
                                                                                Ganancia
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <template
                                                                            v-if="
                                                                                row
                                                                                    .item
                                                                                    .tarifa_detalles
                                                                                    .length >
                                                                                0
                                                                            "
                                                                        >
                                                                            <tr
                                                                                v-for="(
                                                                                    item,
                                                                                    index
                                                                                ) in row
                                                                                    .item
                                                                                    .tarifa_detalles"
                                                                            >
                                                                                <td>
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
                                                                                    </div>
                                                                                </td>
                                                                                <td
                                                                                    class="text-center"
                                                                                >
                                                                                    {{
                                                                                        item
                                                                                            .solicitud_detalle
                                                                                            .cantidad
                                                                                    }}
                                                                                </td>
                                                                                <td
                                                                                    class="text-center bg-primary"
                                                                                >
                                                                                    {{
                                                                                        item
                                                                                            .solicitud_detalle
                                                                                            .titulo
                                                                                    }}
                                                                                </td>
                                                                                <td
                                                                                    class="text-center bg-primary"
                                                                                >
                                                                                    {{
                                                                                        item
                                                                                            .solicitud_detalle
                                                                                            .codigo_color
                                                                                    }}
                                                                                </td>
                                                                                <td
                                                                                    class="text-center bg-primary"
                                                                                >
                                                                                    {{
                                                                                        item
                                                                                            .solicitud_detalle
                                                                                            .peso
                                                                                    }}
                                                                                </td>
                                                                                <td
                                                                                    class="text-center bg-info"
                                                                                >
                                                                                    {{
                                                                                        item.mano_obra
                                                                                    }}
                                                                                </td>
                                                                                <td
                                                                                    class="text-center bg-info"
                                                                                >
                                                                                    {{
                                                                                        item.depreciacion
                                                                                    }}
                                                                                </td>
                                                                                <td
                                                                                    class="text-center bg-info"
                                                                                >
                                                                                    {{
                                                                                        item.ganancia
                                                                                    }}
                                                                                </td>
                                                                                <td
                                                                                    class="text-center"
                                                                                >
                                                                                    {{
                                                                                        item.mano_obra_pagar
                                                                                    }}
                                                                                </td>
                                                                                <td
                                                                                    class="text-center"
                                                                                >
                                                                                    {{
                                                                                        item.depreciacion_pagar
                                                                                    }}
                                                                                </td>
                                                                                <td
                                                                                    class="text-center"
                                                                                >
                                                                                    {{
                                                                                        item.ganancia_pagar
                                                                                    }}
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td
                                                                                    class="text-center font-weight-bold"
                                                                                >
                                                                                    TOTAL
                                                                                </td>
                                                                                <td
                                                                                    class="text-center font-weight-bold"
                                                                                >
                                                                                    {{
                                                                                        row
                                                                                            .item
                                                                                            .cantidad
                                                                                    }}
                                                                                </td>
                                                                                <td
                                                                                    class="text-center font-weight-bold"
                                                                                ></td>
                                                                                <td
                                                                                    class="text-center font-weight-bold"
                                                                                ></td>
                                                                                <td
                                                                                    class="text-center font-weight-bold"
                                                                                >
                                                                                    {{
                                                                                        row
                                                                                            .item
                                                                                            .peso
                                                                                    }}
                                                                                </td>
                                                                                <td
                                                                                    class="text-center font-weight-bold"
                                                                                ></td>
                                                                                <td
                                                                                    class="text-center font-weight-bold"
                                                                                ></td>
                                                                                <td
                                                                                    class="text-center font-weight-bold"
                                                                                ></td>
                                                                                <td
                                                                                    class="text-center font-weight-bold"
                                                                                >
                                                                                    {{
                                                                                        row
                                                                                            .item
                                                                                            .mano_obra
                                                                                    }}
                                                                                </td>
                                                                                <td
                                                                                    class="text-center font-weight-bold"
                                                                                >
                                                                                    {{
                                                                                        row
                                                                                            .item
                                                                                            .depreciacion
                                                                                    }}
                                                                                </td>
                                                                                <td
                                                                                    class="text-center font-weight-bold"
                                                                                >
                                                                                    {{
                                                                                        row
                                                                                            .item
                                                                                            .ganancia
                                                                                    }}
                                                                                </td>
                                                                            </tr>
                                                                        </template>
                                                                        <template
                                                                            v-else
                                                                        >
                                                                            <tr>
                                                                                <td
                                                                                    colspan="11"
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
                                                                    'tarifa_pagos.edit'
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
                                                                    'tarifa_pagos.destroy'
                                                                )
                                                            "
                                                            size="sm"
                                                            pill
                                                            variant="outline-danger"
                                                            class="btn-flat btn-block"
                                                            title="Eliminar registro"
                                                            @click="
                                                                eliminaTarifaPago(
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
                { key: "cliente.empresa", label: "Cliente", sortable: true },
                {
                    key: "solicitud_pedido.codigo",
                    label: "Código de Pedido",
                    sortable: true,
                },
                {
                    key: "cantidad",
                    label: "Cantidad",
                    sortable: true,
                },
                {
                    key: "peso",
                    label: "Peso",
                    sortable: true,
                },
                {
                    key: "mano_obra",
                    label: "Mano de Obra",
                    sortable: true,
                },
                {
                    key: "depreciacion",
                    label: "Depreciación",
                    sortable: true,
                },
                {
                    key: "ganancia",
                    label: "Ganancia",
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
            oTarifaPago: {
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
        this.getTarifaPagos();
    },
    methods: {
        // Listar TarifaPagos
        getTarifaPagos() {
            this.showOverlay = true;
            this.muestra_modal = false;
            let url = main_url + "/admin/tarifa_pagos";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios
                .get(url, {
                    params: { per_page: this.per_page },
                })
                .then((res) => {
                    this.showOverlay = false;
                    this.listRegistros = res.data.tarifa_pagos;
                    this.totalRows = res.data.total;
                });
        },
        editarRegistro(item) {
            this.$router.push({
                name: "tarifa_pagos.edit",
                params: {
                    id: item.id,
                },
            });
        },
        eliminaTarifaPago(id, descripcion) {
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
                        .post(main_url + "/admin/tarifa_pagos/" + id, {
                            _method: "DELETE",
                        })
                        .then((res) => {
                            this.getTarifaPagos();
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
