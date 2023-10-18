<template>
    <div class="content-wrapper contenedor_cajas">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Administrar Caja</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div
                        class="col-md-4 offset-md-4 p-0"
                        v-if="parseFloat(saldo_caja) > 0"
                    >
                        <button
                            class="btn btn-danger btn_cerrar_caja btn-flat btn-block"
                            @click="cerrarCaja()"
                        >
                            <i class="fa fa-times-circle"></i> Cerrar caja
                        </button>
                    </div>
                    <div class="col-md-4 offset-md-4 bg-dark p-3">
                        <h4 class="w-100 text-center">
                            Hoy {{ getFormatoFecha(getFechaActual()) }}
                        </h4>
                        <h4
                            class="w-100 text-center mb-0 bg-warning font-weight-bold pt-2 pb-2 info_saldo"
                        >
                            Bs. {{ saldo_texto }}
                        </h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-md-3">
                                        <button
                                            v-if="
                                                permisos.includes(
                                                    'cajas.create'
                                                )
                                            "
                                            class="btn btn-warning btn-flat btn-block"
                                            @click="
                                                abreModal('nuevo');
                                                limpiaCaja();
                                            "
                                        >
                                            <i class="fa fa-plus"></i>
                                            Nuevo
                                        </button>
                                    </div>
                                    <div class="col-md-3">
                                        <router-link
                                            :to="{
                                                name: 'cajas.MovimientoCajas',
                                            }"
                                            class="btn btn-primary btn-flat btn-block"
                                        >
                                            <i class="fa fa-sync-alt"></i>
                                            Movimientos de Caja
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
                                                <template #cell(tipo)="row">
                                                    <span
                                                        class="text-md font-weight-bold badge badge-warning"
                                                        v-if="
                                                            row.item.tipo ==
                                                            'RECIBO'
                                                        "
                                                    >
                                                        {{ row.item.tipo }}
                                                    </span>
                                                    <span
                                                        v-else
                                                        class="text-md font-weight-bold badge badge-dark"
                                                    >
                                                        {{ row.item.tipo }}
                                                    </span>
                                                </template>
                                                <template
                                                    #cell(tipo_movimiento)="row"
                                                >
                                                    <span
                                                        class="text-md font-weight-bold badge badge-success"
                                                        v-if="
                                                            row.item
                                                                .tipo_movimiento ==
                                                            'INGRESO'
                                                        "
                                                    >
                                                        {{
                                                            row.item
                                                                .tipo_movimiento
                                                        }}
                                                    </span>
                                                    <span
                                                        v-else
                                                        class="text-md font-weight-bold badge badge-danger"
                                                    >
                                                        {{
                                                            row.item
                                                                .tipo_movimiento
                                                        }}
                                                    </span>
                                                </template>
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
                                                            v-if="
                                                                row.item.tipo ==
                                                                'NORMAL'
                                                            "
                                                        >
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Nro.
                                                                    Factura/Recibo:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item.nro
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row
                                                            class="mb-2"
                                                            v-if="
                                                                row.item.tipo ==
                                                                'RECIBO'
                                                            "
                                                        >
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >A favor
                                                                    de:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item.a_favor
                                                            }}</b-col>
                                                        </b-row>
                                                        <b-row class="mb-2">
                                                            <b-col
                                                                sm="3"
                                                                class="text-sm-right"
                                                                ><b
                                                                    >Descripción:</b
                                                                ></b-col
                                                            >
                                                            <b-col>{{
                                                                row.item
                                                                    .descripcion
                                                            }}</b-col>
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
                                                                row.item.tipo ==
                                                                'RECIBO'
                                                            "
                                                            size="sm"
                                                            pill
                                                            variant="outline-primary"
                                                            class="btn-flat btn-block"
                                                            title="Imprimir recibo"
                                                            @click="
                                                                generarRecibo(
                                                                    row.item.id
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-file-pdf"
                                                            ></i>
                                                        </b-button>
                                                        <b-button
                                                            v-if="
                                                                permisos.includes(
                                                                    'cajas.edit'
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
                                                                    'cajas.destroy'
                                                                )
                                                            "
                                                            size="sm"
                                                            pill
                                                            variant="outline-danger"
                                                            class="btn-flat btn-block"
                                                            title="Eliminar registro"
                                                            @click="
                                                                eliminaCaja(
                                                                    row.item.id,
                                                                    `<br/><h4>¿Está seguro(a) de eliminar el registro con fecha ${row.item.fecha}, tipo ${row.item.tipo}, monto ${row.item.monto}?</h4>`
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
            :caja="oCaja"
            @close="muestra_modal = false"
            @envioModal="getCajas"
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
                    key: "fecha",
                    label: "Fecha",
                    sortable: true,
                },
                {
                    key: "tipo",
                    label: "Tipo",
                    sortable: true,
                },
                { key: "tipo_movimiento", label: "Movimiento", sortable: true },
                { key: "concepto.nombre", label: "Concepto" },
                { key: "monto", label: "Monto Bs." },
                { key: "responsable.usuario", label: "Responsble" },
                { key: "fecha_registro", label: "Imagen" },
                { key: "mas", label: "Ver mas" },
                { key: "accion", label: "Acción" },
            ],
            loading: true,
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            muestra_modal: false,
            modal_accion: "nuevo",
            oCaja: {
                id: 0,
                tipo: "",
                tipo_movimiento: "",
                concepto_id: "",
                monto: "",
                responsable_id: "",
                nro_factura: "",
                fecha: "",
                descripcion: "",
                a_favor: "",
                nro: "",
                user_id: "",
                nombre: "",
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
            saldo_texto: "0.00",
            saldo_caja: 0,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getCajas();
    },
    methods: {
        getSaldoCaja() {
            axios.get(main_url + "/admin/cajas/getSaldo").then((response) => {
                this.saldo_texto = response.data.saldo_texto;
                this.saldo_caja = response.data.saldo;
                console.log(parseFloat(this.saldo_caja));
            });
        },

        // Seleccionar Opciones de Tabla
        editarRegistro(item) {
            this.oCaja.id = item.id;
            this.oCaja.tipo = item.tipo ? item.tipo : "NORMAL";
            this.oCaja.tipo_movimiento = item.tipo_movimiento
                ? item.tipo_movimiento
                : "";
            this.oCaja.concepto_id = item.concepto_id ? item.concepto_id : "";
            this.oCaja.concepto = item.concepto;
            this.oCaja.monto = item.monto ? item.monto : "";
            this.oCaja.responsable_id = item.responsable_id
                ? item.responsable_id
                : "";
            this.oCaja.nro_factura = item.nro_factura ? item.nro_factura : "";
            this.oCaja.fecha = item.fecha ? item.fecha : "";
            this.oCaja.descripcion = item.descripcion ? item.descripcion : "";
            this.oCaja.a_favor = item.a_favor ? item.a_favor : "";
            this.oCaja.nro = item.nro ? item.nro : "";
            this.oCaja.user_id = item.user_id ? item.user_id : "";
            this.oCaja.nombre = item.nombre ? item.nombre : "";
            this.modal_accion = "edit";
            this.muestra_modal = true;
        },

        // Listar Cajas
        getCajas() {
            this.showOverlay = true;
            this.muestra_modal = false;
            let url = main_url + "/admin/cajas";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios
                .get(url, {
                    params: { per_page: this.per_page },
                })
                .then((res) => {
                    this.getSaldoCaja();
                    this.showOverlay = false;
                    this.listRegistros = res.data.cajas;
                    this.totalRows = res.data.total;
                });
        },
        generarRecibo(id) {
            let config = {
                responseType: "blob",
            };
            axios
                .post(
                    main_url + "/admin/cajas/generarRecibo/" + id,
                    null,
                    config
                )
                .then((res) => {
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
                        if (
                            error.response.status === 420 ||
                            error.response.status === 419 ||
                            error.response.status === 401
                        ) {
                            window.location = "/";
                        }
                        Swal.fire({
                            icon: "error",
                            title: "Error",
                            html: responseObj.message,
                            showConfirmButton: false,
                            timer: 2000,
                        });
                    }
                });
        },
        eliminaCaja(id, descripcion) {
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
                        .post(main_url + "/admin/cajas/" + id, {
                            _method: "DELETE",
                        })
                        .then((res) => {
                            this.getCajas();
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
        cerrarCaja() {
            Swal.fire({
                title: "¿Quierés cerrar la caja?",
                html: `<strong class="text-lg">Se cerrara la caja con un monto actual  de:<br/> Bs. ${this.saldo_texto}</strong>`,
                showCancelButton: true,
                confirmButtonColor: "#c57a40",
                confirmButtonText:
                    '<i class="fa fa-check"></i> Si, cerrar caja',
                cancelButtonText: '<i class="fa fa-ban"></i> No, cancelar',
                denyButtonText: `<i class="fa fa-check"></i> No, cancelar`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    axios
                        .post(main_url + "/admin/movimiento_cajas")
                        .then((res) => {
                            this.getCajas();
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
        abreModal(tipo_accion = "nuevo", caja = null) {
            this.muestra_modal = true;
            this.modal_accion = tipo_accion;
            if (caja) {
                this.oCaja = caja;
            }
        },
        onFiltered(filteredItems) {
            // Trigger pagination to update the number of buttons/pages due to filtering
            this.totalRows = filteredItems.length;
            this.currentPage = 1;
        },
        limpiaCaja() {
            this.oCaja.tipo = "NORMAL";
            this.oCaja.tipo_movimiento = "";
            this.oCaja.concepto_id = "";
            this.oCaja.monto = "";
            this.oCaja.responsable_id = "";
            this.oCaja.nro_factura = "";
            this.oCaja.fecha = this.getFechaActual();
            this.oCaja.descripcion = "";
            this.oCaja.a_favor = "";
            this.oCaja.nro = "";
            this.oCaja.user_id = "";
            this.oCaja.nombre = "";
        },
        formatoFecha(date) {
            return this.$moment(String(date)).format("DD/MM/YYYY");
        },
    },
};
</script>

<style>
.contenedor_cajas .info_saldo {
    position: relative;
}
</style>
